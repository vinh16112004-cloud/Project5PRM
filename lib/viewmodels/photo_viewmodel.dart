import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project5end/models/photo.dart';
import 'package:project5end/services/api_service.dart';

part 'photo_viewmodel.g.dart';

@riverpod
class PhotoListNotifier extends _$PhotoListNotifier {
  @override
  Future<List<Photo>> build() async {
    return await ApiService().fetchPhotos();
  }
}