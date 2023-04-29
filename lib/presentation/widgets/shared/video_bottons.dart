import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/config/helpers/human_formats.dart';
import 'package:tiktok_clone/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost data;
  const VideoButtons({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.nicepng.com/png/detail/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png'),
              ),
            ),
            Positioned(
              bottom: -2,
              left: 20,
              child: Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Icon(Icons.add, size: 10),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _CustomIconButtom(
            value: data.like, icon: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 20),
        _CustomIconButtom(value: data.view, icon: Icons.comment_rounded),
        const SizedBox(height: 20),
        _CustomIconButtom(value: data.view, icon: Icons.share),
        const SizedBox(height: 20),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 3),
            child: const _CustomIconButtom(
                value: 0, icon: Icons.play_circle_outline)),
      ],
    );
  }
}

class _CustomIconButtom extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;

  const _CustomIconButtom({
    super.key,
    required this.value,
    required this.icon,
    iconColor,
  }) : color = iconColor ?? Colors.white; // Indicamos el color por defecto

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
          color: color,
          iconSize: 40,
        ),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}
