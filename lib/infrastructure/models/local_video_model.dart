import 'package:tiktok_clone/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) =>
      LocalVideoModel(
        /// Se les puede dar un valor por defecto para ralizar la evaluacion en
        /// dado caso no llegara a tener valor el parametro y nos llegue un null
        name: json['name'] ?? 'No name',
        videoUrl: json['videoUrl'],
        views: json['views'] ?? 0,
        likes: json['likes'] ?? 0,
      );

  // Mapper
  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        like: likes,
        view: views,
      );
}
