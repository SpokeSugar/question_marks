// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_cache.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$answerCacheNotifierHash() =>
    r'd3054d29f72c9bd54e8e6053f3c0644c58e933d7';

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

abstract class _$AnswerCacheNotifier
    extends BuildlessNotifier<Map<String, AnswerResultModel>> {
  late final String questionListId;
  late final String questionId;

  Map<String, AnswerResultModel> build(
    String questionListId,
    String questionId,
  );
}

/// See also [AnswerCacheNotifier].
@ProviderFor(AnswerCacheNotifier)
const answerCacheNotifierProvider = AnswerCacheNotifierFamily();

/// See also [AnswerCacheNotifier].
class AnswerCacheNotifierFamily extends Family<Map<String, AnswerResultModel>> {
  /// See also [AnswerCacheNotifier].
  const AnswerCacheNotifierFamily();

  /// See also [AnswerCacheNotifier].
  AnswerCacheNotifierProvider call(
    String questionListId,
    String questionId,
  ) {
    return AnswerCacheNotifierProvider(
      questionListId,
      questionId,
    );
  }

  @override
  AnswerCacheNotifierProvider getProviderOverride(
    covariant AnswerCacheNotifierProvider provider,
  ) {
    return call(
      provider.questionListId,
      provider.questionId,
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
  String? get name => r'answerCacheNotifierProvider';
}

/// See also [AnswerCacheNotifier].
class AnswerCacheNotifierProvider extends NotifierProviderImpl<
    AnswerCacheNotifier, Map<String, AnswerResultModel>> {
  /// See also [AnswerCacheNotifier].
  AnswerCacheNotifierProvider(
    this.questionListId,
    this.questionId,
  ) : super.internal(
          () => AnswerCacheNotifier()
            ..questionListId = questionListId
            ..questionId = questionId,
          from: answerCacheNotifierProvider,
          name: r'answerCacheNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$answerCacheNotifierHash,
          dependencies: AnswerCacheNotifierFamily._dependencies,
          allTransitiveDependencies:
              AnswerCacheNotifierFamily._allTransitiveDependencies,
        );

  final String questionListId;
  final String questionId;

  @override
  bool operator ==(Object other) {
    return other is AnswerCacheNotifierProvider &&
        other.questionListId == questionListId &&
        other.questionId == questionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionListId.hashCode);
    hash = _SystemHash.combine(hash, questionId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Map<String, AnswerResultModel> runNotifierBuild(
    covariant AnswerCacheNotifier notifier,
  ) {
    return notifier.build(
      questionListId,
      questionId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
