// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionManagerHash() => r'bb6848220e575218743b461a47df4499597e38e3';

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

abstract class _$QuestionManager
    extends BuildlessAutoDisposeAsyncNotifier<List<QuestionModel>> {
  late final String id;

  Future<List<QuestionModel>> build(
    String id,
  );
}

/// See also [QuestionManager].
@ProviderFor(QuestionManager)
const questionManagerProvider = QuestionManagerFamily();

/// See also [QuestionManager].
class QuestionManagerFamily extends Family<AsyncValue<List<QuestionModel>>> {
  /// See also [QuestionManager].
  const QuestionManagerFamily();

  /// See also [QuestionManager].
  QuestionManagerProvider call(
    String id,
  ) {
    return QuestionManagerProvider(
      id,
    );
  }

  @override
  QuestionManagerProvider getProviderOverride(
    covariant QuestionManagerProvider provider,
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
  String? get name => r'questionManagerProvider';
}

/// See also [QuestionManager].
class QuestionManagerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    QuestionManager, List<QuestionModel>> {
  /// See also [QuestionManager].
  QuestionManagerProvider(
    this.id,
  ) : super.internal(
          () => QuestionManager()..id = id,
          from: questionManagerProvider,
          name: r'questionManagerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionManagerHash,
          dependencies: QuestionManagerFamily._dependencies,
          allTransitiveDependencies:
              QuestionManagerFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is QuestionManagerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<QuestionModel>> runNotifierBuild(
    covariant QuestionManager notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
