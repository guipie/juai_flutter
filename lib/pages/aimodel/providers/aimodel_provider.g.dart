// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aimodel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initPcPageHash() => r'467145c28742c427ed670c7e21bb8c19cfdda6a1';

/// See also [initPcPage].
@ProviderFor(initPcPage)
final initPcPageProvider = Provider<Object?>.internal(
  initPcPage,
  name: r'initPcPageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$initPcPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InitPcPageRef = ProviderRef<Object?>;
String _$aiModelNotifierHash() => r'0582bc8822f812421b7fda3c6f9a022b79a00fbe';

/// See also [AiModelNotifier].
@ProviderFor(AiModelNotifier)
final aiModelNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AiModelNotifier, PagePagingData<AiModelSort>>.internal(
  AiModelNotifier.new,
  name: r'aiModelNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aiModelNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AiModelNotifier
    = AutoDisposeAsyncNotifier<PagePagingData<AiModelSort>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
