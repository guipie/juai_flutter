// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countdownVcodeHash() => r'c78953fcb0fd21432a6ce4ad7de20755e76a0afc';

/// See also [CountdownVcode].
@ProviderFor(CountdownVcode)
final countdownVcodeProvider =
    AutoDisposeNotifierProvider<CountdownVcode, int>.internal(
  CountdownVcode.new,
  name: r'countdownVcodeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countdownVcodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CountdownVcode = AutoDisposeNotifier<int>;
String _$loginProviderHash() => r'e7ea9848a051471c388d3fdf63408512dfa23cbd';

/// See also [LoginProvider].
@ProviderFor(LoginProvider)
final loginProviderProvider =
    AutoDisposeAsyncNotifierProvider<LoginProvider, LoginModel>.internal(
  LoginProvider.new,
  name: r'loginProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginProvider = AutoDisposeAsyncNotifier<LoginModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package