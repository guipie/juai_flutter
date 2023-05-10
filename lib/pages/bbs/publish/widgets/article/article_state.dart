import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guxin_ai/common/apis/common.dart';
import 'package:guxin_ai/common/server.dart';
import 'package:guxin_ai/common/services/storage.dart';

class ArticleEditSate {
  final FocusNode focusNode = FocusNode();
  Timer? selectAllTimer;
  SelectionType selectionType = SelectionType.none;
  List<String> insertImages = [];
  List<String> insertVideos = [];
  void matchImageInit(String sources) {
    var imageReg = RegExp(Qiniu_External_domain + r'(.{6}/.{10,20})"').allMatches(sources);
    for (RegExpMatch m in imageReg) {
      var imageUrl = m.groups([1]).first ?? "";
      debugPrint("匹配到图片：$imageUrl");
      insertImages.add(imageUrl);
    }
  }

  void deleteImage(String sources) {
    var imageReg = RegExp(Qiniu_External_domain + r'(.{6}/.{10,20})"').allMatches(sources);
    var currentImages = <String>[];
    for (RegExpMatch m in imageReg) {
      var imageUrl = m.groups([1]).first ?? "";
      currentImages.add(imageUrl);
    }
    debugPrint("insertImages${insertImages.toSet()},currentImages:${currentImages.toSet()}");
    Set.from(insertImages).difference(Set.from(currentImages)).forEach((element) {
      CommonApis.deleteQiniuPic(element.toString()).then((value) {
        insertImages.remove(element.toString());
      });
    });
  }

  void setSource(String source, {bool isDelImage = false, bool isDelVideo = false}) {
    StorageService.to.setString("article", source);
    if (isDelImage) deleteImage(source);
  }
}

enum SelectionType {
  none,
  word,
  // line,
}
