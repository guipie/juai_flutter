import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/config.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/utils/utils.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:getwidget/getwidget.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:video_player/video_player.dart';

class CardDongtaiVideoWidget extends StatefulWidget {
  const CardDongtaiVideoWidget(this.videoUrl, {super.key, this.isNetwork = true, this.isFirstLoading = true});
  final String videoUrl;
  final bool isNetwork;
  final bool isFirstLoading;
  @override
  State<CardDongtaiVideoWidget> createState() => _CardDongtaiVideoWidgetState();
}

class _CardDongtaiVideoWidgetState extends State<CardDongtaiVideoWidget> {
  late VideoPlayerController _videoPlayerController;
  late Player _winPlayer;
  late VideoController _winVideoPlayerController;
  var _isPlay = false;
  final _winHeight = 300.0;
  final GlobalKey globalKey = GlobalKey();
  var _isLoadedInit = false;
  @override
  void initState() {
    super.initState();
    if (!widget.isFirstLoading) _setInit();
    debugPrint("视频url:${widget.videoUrl},widget.isNetwork:${widget.isNetwork}");
  }

  void _setInit() {
    debugPrint("第一次初始化_isPlay:$_isPlay");
    if (GetPlatform.isMobile) {
      _videoPlayerController = (widget.isNetwork ? VideoPlayerController.network(QINIU_DOMAIN + widget.videoUrl) : VideoPlayerController.file(File(widget.videoUrl)))
        ..initialize().then((_) {
          _videoPlayerController.play();
          _isPlay = true;
          _isLoadedInit = true;
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
        await _winPlayer.open(Media(widget.isNetwork ? (QINIU_DOMAIN + widget.videoUrl) : widget.videoUrl), play: true);
        _winPlayer.setPlaylistMode(PlaylistMode.single);
        _winPlayer.play();
        _isPlay = true;
        _isLoadedInit = true;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (!widget.isFirstLoading) {
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
        if (widget.isFirstLoading && !_isLoadedInit) {
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
            if (widget.isFirstLoading)
              ImageCacheWidget(
                QiniuUtil.getVideoThumbnail(widget.videoUrl),
                height: 160,
                width: 160,
              ),
            if (!widget.isFirstLoading && !_isLoadedInit)
              const GFLoader(
                type: GFLoaderType.circle,
              ),
            if (_isLoadedInit)
              GetPlatform.isMobile
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
