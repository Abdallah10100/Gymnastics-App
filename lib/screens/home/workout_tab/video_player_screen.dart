import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  final String exerciseTitle; // Exercise title received as an argument
  final int numberOfRepetitions; // Number of repetitions for the exercise

  VideoPlayerScreen(
      {required this.videoPath,
      required this.exerciseTitle,
      required this.numberOfRepetitions});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // Make the body extend behind the app bar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, // Set app bar color to transparent
        elevation: 0, // Remove app bar shadow
        title: Text(
          widget.exerciseTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24, // Adjust the font size
            fontWeight: FontWeight.bold, // Apply bold font weight
          ),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isFullScreen = !_isFullScreen;
              });
            },
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_controller),
                          if (_isFullScreen)
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: SafeArea(
                                  child: IconButton(
                                    icon: Icon(Icons.fullscreen_exit,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        _isFullScreen = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Number of Repetitions: ${widget.numberOfRepetitions}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18, // Adjust the font size
                  fontWeight: FontWeight.bold, // Apply bold font weight
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !_isFullScreen
          ? Padding(
              padding: const EdgeInsets.only(left: 200, bottom: 5),
              // Adjust the right padding here
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
