import 'package:flutter/material.dart';
import 'package:tiktok_clone/presentation/widgets/video/video_gradient_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(1.0) // El volumen siempre se encontrara en 0
      /// Nos inidica si queremos que los videos se repreduscan automaticamente
      /// y se vuelvan a empezar
      ..setLooping(true)
      ..play(); // Siempre inicializado
  }

  /// El dispose diempre va a inicializarce debajo del initState para poder limpiar
  @override
  void dispose() {
    super.dispose();

    /// Con esto limpiamos el controlador asi que evitamos que el video se siga reproduciendo
    /// aunque ya no se siga viendo o alguna otra fuga de memoria
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(), // Se inicializa el controlador
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            /// Para saber cual sera el aspecto del video utilizamos el
            /// [controller.value.aspectRatio]
            aspectRatio: controller.value.aspectRatio,

            /// Colocamos un widget [VideoPlayer] que vienen en el paquete video_player
            /// y le pasamos el controlador
            child: Stack(
              children: [
                VideoPlayer(controller),
                // Gradiente
                VideoBackground(stops: const [0.8, 1.0]),
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({
    super.key,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: textStyle,
      ),
    );
  }
}
