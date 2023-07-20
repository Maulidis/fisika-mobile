import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


class VideoView extends StatefulWidget {
  final String videoUrl;

  const VideoView({required this.videoUrl, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: 16 / 9, // Ubah sesuai rasio aspek video Anda
      allowFullScreen: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white,
      ),
    );

    _videoPlayerController.addListener(_videoPlayerListener);
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    try {
      await _videoPlayerController.initialize();
    } catch (error) {
      print('Error initializing video player: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _videoPlayerListener() {
    if (_videoPlayerController.value.hasError) {
      print(
          'Error playing video: ${_videoPlayerController.value.errorDescription}');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_videoPlayerListener);
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: _isLoading
                ? CircularProgressIndicator() // Indikator loading
                : Chewie(
                    controller: _chewieController,
                  ),
          ),
        ],
      ),
    );
  }
}
