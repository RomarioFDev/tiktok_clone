class VideoPost {
  final String caption;
  final String videoUrl;
  final int like;
  final int view;

  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.like = 0,
    this.view = 0,
  });
}
