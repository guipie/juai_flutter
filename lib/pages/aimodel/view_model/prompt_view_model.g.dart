// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'prompt_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$promptReqNotifierHash() => r'991a993f06bc55ae8950a3e0983a3a826bba6771';

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
String _$promptVMHash() => r'f6ca96550ea161c7f26aa8b70ef4ab8b2039f3ab';

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
