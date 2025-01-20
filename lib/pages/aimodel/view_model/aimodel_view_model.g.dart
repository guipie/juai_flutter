// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'aimodel_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentAiModelNotifierHash() =>
    r'118adb91125b3d7eb9a3ffd38061cdda80f7af9a';

/// See also [CurrentAiModelNotifier].
@ProviderFor(CurrentAiModelNotifier)
final currentAiModelNotifierProvider =
    AutoDisposeNotifierProvider<CurrentAiModelNotifier, AiModelRes?>.internal(
  CurrentAiModelNotifier.new,
  name: r'currentAiModelNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAiModelNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentAiModelNotifier = AutoDisposeNotifier<AiModelRes?>;
String _$aiModelVmHash() => r'4a517774e3b7e1634f851e8c5faa98d2008dac46';

/// See also [AiModelVm].
@ProviderFor(AiModelVm)
final aiModelVmProvider = AutoDisposeAsyncNotifierProvider<AiModelVm,
    PagePagingData<AiModelSort>>.internal(
  AiModelVm.new,
  name: r'aiModelVmProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aiModelVmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AiModelVm = AutoDisposeAsyncNotifier<PagePagingData<AiModelSort>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
