// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WishlistNotifier)
final wishlistProvider = WishlistNotifierProvider._();

final class WishlistNotifierProvider
    extends $AsyncNotifierProvider<WishlistNotifier, List<Photo>> {
  WishlistNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishlistProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishlistNotifierHash();

  @$internal
  @override
  WishlistNotifier create() => WishlistNotifier();
}

String _$wishlistNotifierHash() => r'7fc3740423af758bb82705e975c5d69bd3bf32a8';

abstract class _$WishlistNotifier extends $AsyncNotifier<List<Photo>> {
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
