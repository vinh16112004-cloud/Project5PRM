import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project5end/models/photo.dart';
import 'package:project5end/services/database_service.dart';

part 'wishlist_viewmodel.g.dart';

@riverpod
class WishlistNotifier extends _$WishlistNotifier {
  @override
  Future<List<Photo>> build() async {
    return await DatabaseService.instance.getWishlistPhotos();
  }

  Future<void> toggleWishlist(Photo photo, bool isFavorite) async {
    if (isFavorite) {
      await DatabaseService.instance.insertPhoto(photo);
    } else {
      await DatabaseService.instance.deletePhoto(photo.id);
    }
    state = AsyncData(await DatabaseService.instance.getWishlistPhotos());
  }
}