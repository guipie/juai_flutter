// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aimodel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aiModelDataNotifierHash() =>
    r'88c9cefc9f2a27d032aeb569c23bc8c840b8d85a';

/// See also [AiModelDataNotifier].
@ProviderFor(AiModelDataNotifier)
final aiModelDataNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AiModelDataNotifier, PagePagingData<AiModelSort>>.internal(
  AiModelDataNotifier.new,
  name: r'aiModelDataNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aiModelDataNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AiModelDataNotifier
    = AutoDisposeAsyncNotifier<PagePagingData<AiModelSort>>;
String _$aiModelProviderHash() => r'fa6299ae748361b25113b312874e0a620d0fdc86';

/// See also [AiModelProvider].
@ProviderFor(AiModelProvider)
final aiModelProviderProvider =
    AutoDisposeNotifierProvider<AiModelProvider, AiModelModel>.internal(
  AiModelProvider.new,
  name: r'aiModelProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aiModelProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AiModelProvider = AutoDisposeNotifier<AiModelModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
