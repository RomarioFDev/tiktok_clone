import 'package:flutter/material.dart';
import 'package:tiktok_clone/domain/entities/video_post.dart';
import 'package:tiktok_clone/presentation/widgets/video/fullscreen_player.dart';
import 'package:tiktok_clone/presentation/widgets/widgets.dart';

class VideoScrrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            /// VideoPlay and Gradiente
            /// Recordar que en el manifest de android se dede de solicitar
            /// permisos de internet para poder cargar videos de internet, el
            /// paquete [video_player] nos da el permiso en la Doc

            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),
            Positioned(
                left: size.width * 0.5 - 40,
                top: 50,
                child: Row(
                  children: const [
                    Text('Siguiendo'),
                    Text(' | '),
                    Text(
                      'Para ti',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                )),
            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(data: videoPost),
            )
          ],
        );
      },
    );
  }
}
