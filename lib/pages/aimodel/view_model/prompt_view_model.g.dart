// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'prompt_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$promptReqNotifierHash() => r'b2dcd8a7e57a34f14dec54209b6b870d0b4a5430';

/// See also [PromptReqNotifier].
@ProviderFor(PromptReqNotifier)
final promptReqNotifierProvider =
    NotifierProvider<PromptReqNotifier, PromptReq>.internal(
  PromptReqNotifier.new,
  name: r'promptReqNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$promptReqNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PromptReqNotifier = Notifier<PromptReq>;
String _$promptVMHash() => r'9c97b08059a29dbd781537ba4d17d5983009a455';

/// See also [PromptVM].
@ProviderFor(PromptVM)
final promptVMProvider = AutoDisposeAsyncNotifierProvider<PromptVM,
    PagePagingData<PromptRes>>.internal(
  PromptVM.new,
  name: r'promptVMProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$promptVMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PromptVM = AutoDisposeAsyncNotifier<PagePagingData<PromptRes>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
