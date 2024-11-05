import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'app-theme.dart';

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Charger la video
    _controller = VideoPlayerController.asset('assets/startup_splashscreen.mp4');

    // Attention l'event du listener est appelé chaque frame
    _controller.addListener(() {
      setState(() {});
      // Tester quand la video est terminé
      if (_controller.value.position == _controller.value.duration){
        print("Terminé");
        // Changer de page
        Navigator.pushNamed(context, "/login");
      }
    });

    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    //_controller.setVolume(0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size?.width ?? 0,
              height: _controller.value.size?.height ?? 0,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
      ],
    );
  }
}
