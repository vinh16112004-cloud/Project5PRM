import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project5end/viewmodels/photo_viewmodel.dart';
import 'package:project5end/viewmodels/wishlist_viewmodel.dart';
import 'package:project5end/viewmodels/theme_viewmodel.dart';
import 'package:project5end/views/wishlist_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Dùng photoListProvider
    final photoListAsync = ref.watch(photoListProvider);
    // Dùng wishlistProvider
    final wishlistAsync = ref.watch(wishlistProvider);
    // Dùng themeProvider
    final themeMode = ref.watch(themeProvider);

    final favoriteIds = wishlistAsync.maybeWhen(
      data: (wishlistPhotos) => wishlistPhotos.map((p) => p.id).toSet(),
      orElse: () => <int>{},
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('API Photos Lab 5'),
        actions: [
          IconButton(
            icon: Icon(themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.redAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WishlistScreen()),
              );
            },
          ),
        ],
      ),
      body: photoListAsync.when(
        data: (photos) {
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              final isFavorite = favoriteIds.contains(photo.id);

              return ListTile(
                leading: Image.network(
                  photo.thumbnailUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(photo.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text('ID: ${photo.id}'),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () async {
                    // Dùng wishlistProvider
                    await ref
                        .read(wishlistProvider.notifier)
                        .toggleWishlist(photo, !isFavorite);
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