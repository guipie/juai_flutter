import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/server.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/utils/utils.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/pages/bbs/video/index.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:video_player/video_player.dart';

class CardDongtaiVideoWidget extends StatefulWidget {
  const CardDongtaiVideoWidget(this.videoUrl, {super.key});
  final String videoUrl;
  @override
  State<CardDongtaiVideoWidget> createState() => _CardDongtaiVideoWidgetState();
}

class _CardDongtaiVideoWidgetState extends State<CardDongtaiVideoWidget> {
  late VideoPlayerController _videoPlayerController;
  late Player _winPlayer;
  late VideoController _winVideoPlayerController;
  var _isPlay = false;
  bool _isFirstLoading = true;
  final _winHeight = 300.0;
  final GlobalKey globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    debugPrint("视频url:${widget.videoUrl}");
  }

  void _setInit() {
    debugPrint("第一次初始化_isPlay:$_isPlay");
    if (GetPlatform.isMobile) {
      _videoPlayerController = VideoPlayerController.network(Qiniu_External_domain + widget.videoUrl)
        ..initialize().then((_) {
          _videoPlayerController.play();
          _isPlay = true;
          _isFirstLoading = false;
          setState(() {});
        })
        ..addListener(() {
          if (_videoPlayerController.value.position == _videoPlayerController.value.duration) {
            setState(() {
              _isPlay = false;
            });
          }
        });
    } else {
      Future.microtask(() async {
        _winPlayer = Player();
        _winVideoPlayerController = VideoController(_winPlayer);

        // Play any media source.
        await _winPlayer.open(Media(Qiniu_External_domain + widget.videoUrl), play: true);
        _winPlayer.setPlaylistMode(PlaylistMode.single);
        _winPlayer.play();
        _isPlay = true;
        _isFirstLoading = false;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (!_isFirstLoading) {
      if (GetPlatform.isMobile) {
        _videoPlayerController.dispose();
      } else {
        Future.microtask(() async {
          /// Release allocated resources back to the system.
          await _winPlayer.dispose();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (_isFirstLoading) {
          _setInit();
        } else {
          if (GetPlatform.isMobile) {
            if (_videoPlayerController.value.isPlaying) {
              await _videoPlayerController.pause();
            } else {
              await _videoPlayerController.play();
            }
            setState(() {
              _isPlay = _videoPlayerController.value.isPlaying;
            });
          } else {
            _winPlayer.playOrPause();
            setState(() {
              _isPlay = !_isPlay;
            });
          }
        }
      },
      child: Container(
        key: globalKey,
        margin: const EdgeInsets.only(left: 2, top: 8),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _isFirstLoading
                ? ImageCacheWidget(
                    QiniuUtil.getVideoThumbnail(widget.videoUrl),
                    height: 160,
                    width: 160,
                  )
                : GetPlatform.isMobile
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      )
                    : Video(
                        height: _winHeight,
                        controller: _winVideoPlayerController,
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
