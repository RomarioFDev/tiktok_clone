import 'package:tiktok_clone/domain/entities/video_post.dart';

abstract class VideoPostRepositorie {
  Future<List<VideoPost>> getFavoriteVideoByUser(int page);
  Future<List<VideoPost>> getTrandingVideosByPage(int page);
}
