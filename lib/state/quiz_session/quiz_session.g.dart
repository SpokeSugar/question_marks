// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionSessionsHash() => r'7708edd82b98af22267cce54b24cfaecd3db108b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$QuestionSessions
    extends BuildlessAutoDisposeNotifier<QuestionSessionState> {
  late final String id;

  QuestionSessionState build(
    String id,
  );
}

/// See also [QuestionSessions].
@ProviderFor(QuestionSessions)
const questionSessionsProvider = QuestionSessionsFamily();

/// See also [QuestionSessions].
class QuestionSessionsFamily extends Family<QuestionSessionState> {
  /// See also [QuestionSessions].
  const QuestionSessionsFamily();

  /// See also [QuestionSessions].
  QuestionSessionsProvider call(
    String id,
  ) {
    return QuestionSessionsProvider(
      id,
    );
  }

  @override
  QuestionSessionsProvider getProviderOverride(
    covariant QuestionSessionsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'questionSessionsProvider';
}

/// See also [QuestionSessions].
class QuestionSessionsProvider extends AutoDisposeNotifierProviderImpl<
    QuestionSessions, QuestionSessionState> {
  /// See also [QuestionSessions].
  QuestionSessionsProvider(
    this.id,
  ) : super.internal(
          () => QuestionSessions()..id = id,
          from: questionSessionsProvider,
          name: r'questionSessionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionSessionsHash,
          dependencies: QuestionSessionsFamily._dependencies,
          allTransitiveDependencies:
              QuestionSessionsFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is QuestionSessionsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  QuestionSessionState runNotifierBuild(
    covariant QuestionSessions notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
