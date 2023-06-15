import 'dart:async';

import 'package:flutter/material.dart';
import 'package:JuAI/common/apis/common_api.dart';
import 'package:JuAI/common/config.dart';
import 'package:JuAI/common/services/storage.dart';
import 'package:JuAI/common/values/storage.dart';

class ArticleEditSate {
  final FocusNode focusNode = FocusNode();
  Timer? selectAllTimer;
  SelectionType selectionType = SelectionType.none;
  List<String> insertFiles = [];
  List<String> insertVideos = [];

  void matchFileInit(String sources) {
    var imageReg = RegExp(QINIU_DOMAIN + r'(.{6}/.{10,20})"').allMatches(sources);
    for (RegExpMatch m in imageReg) {
      var imageUrl = m.groups([1]).first ?? "";
      debugPrint("匹配到文件：$imageUrl");
      insertFiles.add(imageUrl);
    }
  }

  void deleteFile(String sources) {
    var imageReg = RegExp(QINIU_DOMAIN + r'(.{6}/.{10,20})"').allMatches(sources);
    var currentImages = <String>[];
    for (RegExpMatch m in imageReg) {
      var imageUrl = m.groups([1]).first ?? "";
      currentImages.add(imageUrl);
    }
    debugPrint("insertImages${insertFiles.toSet()},currentImages:${currentImages.toSet()}");
    Set.from(insertFiles).difference(Set.from(currentImages)).forEach((element) {
      CommonApis.deleteQiniuPic(element.toString()).then((value) {
        insertFiles.remove(element.toString());
      });
    });
  }

  void setSource(String source, String text, {bool isDelImage = false, bool isDelVideo = false}) {
    StorageService.to.setString(STORAGE_ARTICLE_DELTA, source);
    StorageService.to.setString(STORAGE_ARTICLE_TEXT, text);
    if (isDelImage) deleteFile(source);
  }
}

enum SelectionType {
  none,
  word,
  // line,
}
