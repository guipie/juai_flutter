import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:guxin_ai/common/server.dart';
import 'package:guxin_ai/common/theme.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:video_player/video_player.dart';

class VideoPlayCardWidget extends StatefulWidget {
  const VideoPlayCardWidget(this.videoUrl, {super.key});
  final String videoUrl;
  @override
  State<VideoPlayCardWidget> createState() => _VideoPlayCardWidgetState();
}

class _VideoPlayCardWidgetState extends State<VideoPlayCardWidget> {
  late VideoPlayerController _videoPlayerController;
  late Player _winPlayer;
  late VideoController? _winVideoPlayerController;
  double _winHeight = 400;
  var _isPlay = false;
  bool _isLoading = true;
  final GlobalKey globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    debugPrint("视频url:${widget.videoUrl}");
    if (GetPlatform.isMobile) {
      _videoPlayerController = VideoPlayerController.network(Qiniu_External_domain + widget.videoUrl)
        ..initialize().then((_) {
          _isLoading = false;
          setState(() {});
        })
        ..addListener(() {});
    } else {
      Future.microtask(() async {
        _winPlayer = Player();

        _winVideoPlayerController = await VideoController.create(_winPlayer);
        // Play any media source.
        await _winPlayer.open(Media(Qiniu_External_domain + widget.videoUrl), play: false);
        _winPlayer.setPlaylistMode(PlaylistMode.single);
        _isLoading = false;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (GetPlatform.isMobile) {
      _videoPlayerController.dispose();
    } else {
      Future.microtask(() async {
        /// Release allocated resources back to the system.
        await _winVideoPlayerController?.dispose();
        await _winPlayer.dispose();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _isPlay = !_isPlay;
        if (GetPlatform.isMobile) {
          if (_isPlay) {
            _videoPlayerController.pause();
          } else {
            _videoPlayerController.play();
          }
        } else {
          _winPlayer.playOrPause();
        }
        setState(() {});
      },
      child: Container(
        key: globalKey,
        margin: const EdgeInsets.only(left: 4, top: 8),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _isLoading
                ? const GFLoader(type: GFLoaderType.circle)
                : Center(
                    child: GetPlatform.isMobile
                        ? AspectRatio(
                            aspectRatio: _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController),
                          )
                        : Video(
                            height: _winHeight,
                            controller: _winVideoPlayerController,
                          ),
                  ),
            if (!_isPlay)
              Positioned(
                child: Icon(
                  Icons.play_circle_fill_outlined,
                  size: WcaoTheme.fsXlll,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
