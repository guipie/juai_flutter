// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryHash() => r'07d77b498b0130626bdb5f4af5726f65715d6a64';

/// See also [category].
@ProviderFor(category)
final categoryProvider = AutoDisposeProvider<String>.internal(
  category,
  name: r'categoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryRef = AutoDisposeProviderRef<String>;
String _$promptNotifierHash() => r'a2f6d35d28d8c2c48b7e781a72a683e87ec6f081';

/// See also [PromptNotifier].
@ProviderFor(PromptNotifier)
final promptNotifierProvider = AutoDisposeAsyncNotifierProvider<PromptNotifier,
    PagePagingData<Prompt>>.internal(
  PromptNotifier.new,
  name: r'promptNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$promptNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PromptNotifier = AutoDisposeAsyncNotifier<PagePagingData<Prompt>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
