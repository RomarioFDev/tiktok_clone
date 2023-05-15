import 'package:tiktok_clone/domain/datasources/video_post_datasource.dart';
import 'package:tiktok_clone/domain/entities/video_post.dart';
import 'package:tiktok_clone/domain/repositories/video_post_repositorie.dart';

class VideoPostRepositoryImpl implements VideoPostRepositorie {
  final VideoPostDatasource videoPostDatasource;

  VideoPostRepositoryImpl({required this.videoPostDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrandingVideosByPage(int page) {
    return videoPostDatasource.getTrandingVideosByPage(page);
  }
}
