import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/presentation/providers/dicover_provider.dart';
import 'package:tiktok_clone/presentation/widgets/widgets.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Se crea la referencia al provider para obtener la data
    final discoverProvider = context.watch<DiscoverProvider>();
    return Scaffold(
      body: discoverProvider.initialLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : VideoScrrollableView(videos: discoverProvider.videos),
    );
  }
}
