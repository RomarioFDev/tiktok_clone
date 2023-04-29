import 'package:flutter/material.dart';
import 'package:tiktok_clone/domain/entities/video_post.dart';
import 'package:tiktok_clone/infrastructure/models/local_video_model.dart';
import 'package:tiktok_clone/shared/data/local_video_post.dart';

/// Para crear un provider siempre debera de extender de una [ChageNotifier]
class DiscoverProvider extends ChangeNotifier {
  /// Todo: Repository, DataSource

  /// Verificara si al iniciar la aplicacion nos idica si hay un video
  bool initialLoading = true;
  List<VideoPost> videos = [];

  /// Future para cargar los videos locales
  Future<void> loadNextPage() async {
    // Future.delayed(const Duration(seconds: 2));

    /// Convertir los datos de videoPost de la carpeta shared a una lista
    /// permitida de VideoPost, retornando una nueva instancia de fromJsonMap
    /// mapenadola con toVideoPostEntity

    final List<VideoPost> newVideo = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();

    // Se guardar los datos mapeados en la lista [videos]
    videos.addAll(newVideo);

    initialLoading = false;

    notifyListeners();
  }
}
