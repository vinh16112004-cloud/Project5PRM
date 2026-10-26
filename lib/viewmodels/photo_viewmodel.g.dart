// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotoListNotifier)
final photoListProvider = PhotoListNotifierProvider._();

final class PhotoListNotifierProvider
    extends $AsyncNotifierProvider<PhotoListNotifier, List<Photo>> {
  PhotoListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoListNotifierHash();

  @$internal
  @override
  PhotoListNotifier create() => PhotoListNotifier();
}

String _$photoListNotifierHash() => r'c806e9bbc0758df84e34458418a7b250e10ec1ba';

abstract class _$PhotoListNotifier extends $AsyncNotifier<List<Photo>> {
  FutureOr<List<Photo>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Photo>>, List<Photo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Photo>>, List<Photo>>,
              AsyncValue<List<Photo>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
