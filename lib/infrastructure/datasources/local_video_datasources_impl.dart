import 'package:tiktok_clone/domain/datasources/video_post_datasource.dart';
import 'package:tiktok_clone/domain/entities/video_post.dart';
import 'package:tiktok_clone/infrastructure/models/local_video_model.dart';
import 'package:tiktok_clone/shared/data/local_video_post.dart';

class LocalVideoDataSource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrandingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideo = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();
    return newVideo;
  }
}
