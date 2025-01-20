import 'package:easy_refresh/easy_refresh.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../base/base.dart';
import '../../pages/login/login_page.dart';
import '../../pages/login/provider/user_provider.dart';
import '../../services/http/interceptor/api_exception.dart';
import 'paging_data.dart';
import 'paging_notifier_mixin.dart';

/// A generic widget for pagination.
///
/// Main features:
/// 1. Displays the widget created by [contentBuilder] when data is available.
/// 2. Shows a CircularProgressIndicator while loading the first page.
/// 3. Displays an error widget when there is an error on the first page.
/// 4. Shows error messages using a SnackBar.
/// 5. Loads the next page when the last item is displayed.
/// 6. Supports pull-to-refresh functionality.
///
/// You can customize the appearance of the loading view, error view, and endItemView using [PagingWidgetTheme].
final class PagingWidget<D extends PagingData<I>, I> extends ConsumerWidget {
  const PagingWidget({
    required this.provider,
    required this.futureRefreshable,
    required this.notifierRefreshable,
    required this.contentBuilder,
    this.showSecondPageError = true,
    this.padding = const EdgeInsets.only(left: 16, top: 10, bottom: 20),
    super.key,
  });

  final ProviderListenable<AsyncValue<D>> provider;
  final Refreshable<Future<D>> futureRefreshable;
  final Refreshable<PagingNotifierMixin<D, I>> notifierRefreshable;
  final EdgeInsetsGeometry padding;

  /// Specifies a function that returns a widget to display when data is available.
  /// endItemView is a widget to detect when the last displayed item is visible.
  /// If endItemView is non-null, it is displayed at the end of the list.
  final Widget Function(D data, int widgetCount, Widget endItemView) contentBuilder;

  final bool showSecondPageError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loadingBuilder(context) => const Center(
          child: CircularProgressIndicator(),
        );
    errorBuilder(context, e, st, onPressed) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.refresh),
              ),
              Text((e?.message) ?? S.current.error_),
            ],
          ),
        );
    return ref.watch(provider).whenIgnorableError(
          data: (
            data, {
            required hasError,
            required isLoading,
            required error,
          }) {
            final content = contentBuilder(
              data,
              // Add 1 to the length to include the endItemView
              data.items.length + 1,
              switch ((data.hasMore, hasError, isLoading)) {
                // Display a widget to detect when the last element is reached
                // if there are more pages and no errors
                (true, false, _) => _EndVDLoadingItemView(
                    onScrollEnd: () => ref.read(notifierRefreshable).loadNext(),
                  ),
                (true, true, false) when showSecondPageError => _EndErrorItemView(
                    error: error,
                    onRetryButtonPressed: () => ref.read(notifierRefreshable).loadNext(),
                  ),
                (true, true, true) => const _EndLoadingItemView(),
                _ => const SizedBox.shrink(),
              },
            );
            return EasyRefresh.builder(
              header: BezierCircleHeader(
                triggerOffset: 40,
                foregroundColor: fl.FluentTheme.of(context).accentColor,
                backgroundColor: fl.FluentTheme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
              ),
              footer: BezierFooter(
                triggerOffset: 40,
                foregroundColor: fl.FluentTheme.of(context).accentColor,
                backgroundColor: fl.FluentTheme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                clamping: true,
                showBalls: true,
                spinInCenter: true,
                onlySpin: true,
                spinWidget: data.hasMore
                    ? null
                    : Text(
                        S.current.no_more_data,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
              ),
              onRefresh: () async => ref.refresh(futureRefreshable),
              onLoad: () async => await ref.read(notifierRefreshable).loadNext(),
              childBuilder: (BuildContext context, ScrollPhysics physics) {
                return SingleChildScrollView(
                  padding: padding,
                  child: content,
                );
              },
            );
          },
          // Loading state for the first page
          loading: () => loadingBuilder(context),
          // Error state for the first page
          error: (e, st) => errorBuilder(
            context,
            e,
            st,
            () async {
              if (e is ApiException && e.code == 401) {
                await F.push(LoginPage());
                if (!ref.read(curentUserProvider.notifier).isLogin) return;
              }
              ref.read(notifierRefreshable).forceRefresh();
            },
          ),
          // Prioritize data for errors on the second page and beyond
          skipErrorOnHasValue: true,
        );
  }
}

final class _EndLoadingItemView extends StatelessWidget {
  const _EndLoadingItemView();

  @override
  Widget build(BuildContext context) {
    childBuilder(context) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        );

    return childBuilder(context);
  }
}

final class _EndVDLoadingItemView extends StatelessWidget {
  const _EndVDLoadingItemView({
    required this.onScrollEnd,
  });
  final VoidCallback onScrollEnd;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: key ?? const Key('EndItem'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          onScrollEnd();
        }
      },
      child: const _EndLoadingItemView(),
    );
  }
}

final class _EndErrorItemView extends StatelessWidget {
  const _EndErrorItemView({
    required this.error,
    required this.onRetryButtonPressed,
  });
  final Object? error;
  final VoidCallback onRetryButtonPressed;

  @override
  Widget build(BuildContext context) {
    childBuilder(context, e, onPressed) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.refresh),
                ),
                Text(
                  error.toString(),
                ),
              ],
            ),
          ),
        );

    return childBuilder(context, error, onRetryButtonPressed);
  }
}

extension _AsyncValueX<T> on AsyncValue<T> {
  /// Extends the [when] method to handle async data states more effectively,
  /// especially when maintaining data integrity despite errors.
  ///
  /// Use `skipErrorOnHasValue` to retain and display existing data
  /// even if subsequent fetch attempts result in errors,
  /// ideal for maintaining a seamless user experience.
  R whenIgnorableError<R>({
    required R Function(
      T data, {
      required bool hasError,
      required bool isLoading,
      required Object? error,
    }) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    bool skipErrorOnHasValue = false,
  }) {
    if (skipErrorOnHasValue) {
      if (hasValue && hasError) {
        return data(
          requireValue,
          hasError: true,
          isLoading: isLoading,
          error: this.error,
        );
      }
    }

    return when(
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
      data: (d) => data(d, hasError: hasError, isLoading: isLoading, error: this.error),
      error: error,
      loading: loading,
    );
  }
}
