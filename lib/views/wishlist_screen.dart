import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project5end/viewmodels/wishlist_viewmodel.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sửa ở đây: dùng wishlistProvider
    final wishlistAsync = ref.watch(wishlistProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách Quan tâm (Wishlist)')),
      body: wishlistAsync.when(
        data: (photos) {
          if (photos.isEmpty) {
            return const Center(child: Text('Chưa có ảnh nào được quan tâm.'));
          }
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return ListTile(
                leading: Image.network(
                  photo.thumbnailUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(photo.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    // Sửa ở đây: dùng wishlistProvider
                    ref.read(wishlistProvider.notifier).toggleWishlist(photo, false);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}