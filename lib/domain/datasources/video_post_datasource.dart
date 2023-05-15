import 'package:tiktok_clone/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getFavoriteVideoByUser(String userID);
  Future<List<VideoPost>> getTrandingVideosByPage(int page);
}
