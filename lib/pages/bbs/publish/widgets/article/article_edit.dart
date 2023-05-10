import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/extensions.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:getwidget/getwidget.dart';
import 'package:guxin_ai/common/components/flutter_quill/lib/src/translations/toolbar.i18n.dart';
import 'package:guxin_ai/common/server.dart';
import 'package:guxin_ai/common/services/services.dart';
import 'package:guxin_ai/common/utils/utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'article_state.dart';
import 'read_only_page.dart';
import 'universal_ui/universal_ui.dart';

class ArticleEditPage extends StatefulWidget {
  const ArticleEditPage({super.key});

  @override
  _ArticleEditPageState createState() => _ArticleEditPageState();
}

class _ArticleEditPageState extends State<ArticleEditPage> {
  ArticleEditSate state = ArticleEditSate();
  late QuillController _controller;
  @override
  void dispose() {
    state.selectAllTimer?.cancel();
    state.setSource(jsonEncode(_controller.document.toDelta().toJson()), isDelImage: true, isDelVideo: true);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    try {
      debugPrint("初始化document：${StorageService.to.getString("article")}");
      var existDoc = StorageService.to.getString("article");
      setState(() {
        _controller = QuillController(
          document: Document.fromJson(jsonDecode(existDoc)),
          selection: const TextSelection.collapsed(offset: 0),
        );
      });
      state.matchImageInit(existDoc);
    } catch (error) {
      debugPrint(error.toString());
      final doc = Document()..insert(0, '..');
      setState(() {
        _controller = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    }
    _controller.addListener(() {
      var json = jsonEncode(_controller.document.toDelta().toJson());
      state.setSource(json);
      debugPrint(json);
      // state.deleteImage(source);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        color: Colors.grey.shade800,
        child: _buildMenuBar(context),
      ),
      body: _buildWelcomeEditor(context),
    );
  }

  bool _onTripleClickSelection() {
    final controller = _controller;

    state.selectAllTimer?.cancel();
    state.selectAllTimer = null;

    // If you want to select all text after paragraph, uncomment this line
    // if (state.selectionType == SelectionType.line) {
    //   final selection = TextSelection(
    //     baseOffset: 0,
    //     extentOffset: controller.document.length,
    //   );

    //   controller.updateSelection(selection, ChangeSource.REMOTE);

    //   state.selectionType = SelectionType.none;

    //   return true;
    // }

    if (controller.selection.isCollapsed) {
      state.selectionType = SelectionType.none;
    }

    if (state.selectionType == SelectionType.none) {
      state.selectionType = SelectionType.word;
      _startTripleClickTimer();
      return false;
    }

    if (state.selectionType == SelectionType.word) {
      final child = controller.document.queryChild(
        controller.selection.baseOffset,
      );
      final offset = child.node?.documentOffset ?? 0;
      final length = child.node?.length ?? 0;

      final selection = TextSelection(
        baseOffset: offset,
        extentOffset: offset + length,
      );

      controller.updateSelection(selection, ChangeSource.REMOTE);

      // state.selectionType = SelectionType.line;

      state.selectionType = SelectionType.none;

      _startTripleClickTimer();

      return true;
    }

    return false;
  }

  void _startTripleClickTimer() {
    state.selectAllTimer = Timer(const Duration(milliseconds: 900), () {
      state.selectionType = SelectionType.none;
    });
  }

  Widget _buildWelcomeEditor(BuildContext context) {
    Widget quillEditor = MouseRegion(
      cursor: SystemMouseCursors.text,
      child: QuillEditor(
        controller: _controller!,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: state.focusNode,
        autoFocus: false,
        readOnly: false,
        placeholder: '优质社区文章，需要您的贡献',
        enableSelectionToolbar: isMobile(),
        expands: false,
        padding: EdgeInsets.zero,
        onImagePaste: _onImagePaste,
        onTapUp: (details, p1) {
          return _onTripleClickSelection();
        },
        customStyles: DefaultStyles(
          h1: DefaultTextBlockStyle(
              const TextStyle(
                fontSize: 32,
                color: Colors.black,
                height: 1.15,
                fontWeight: FontWeight.w300,
              ),
              const VerticalSpacing(16, 0),
              const VerticalSpacing(0, 0),
              null),
          sizeSmall: const TextStyle(fontSize: 9),
        ),
        embedBuilders: [...FlutterQuillEmbeds.builders(), NotesEmbedBuilder(addEditNote: _addEditNote)],
      ),
    );
    if (kIsWeb) {
      quillEditor = MouseRegion(
        cursor: SystemMouseCursors.text,
        child: QuillEditor(
            controller: _controller,
            scrollController: ScrollController(),
            scrollable: true,
            focusNode: state.focusNode,
            autoFocus: false,
            readOnly: false,
            placeholder: '优质社区文章，需要您的贡献',
            expands: false,
            padding: EdgeInsets.zero,
            onTapUp: (details, p1) {
              return _onTripleClickSelection();
            },
            customStyles: DefaultStyles(
              h1: DefaultTextBlockStyle(
                  const TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    height: 1.15,
                    fontWeight: FontWeight.w300,
                  ),
                  const VerticalSpacing(16, 0),
                  const VerticalSpacing(0, 0),
                  null),
              sizeSmall: const TextStyle(fontSize: 9),
            ),
            embedBuilders: [
              ...defaultEmbedBuildersWeb,
              NotesEmbedBuilder(addEditNote: _addEditNote),
            ]),
      );
    }
    var toolbar = QuillToolbar.basic(
      multiRowsDisplay: false,
      showFontFamily: false,
      showFontSize: false,
      showSubscript: false,
      toolbarIconCrossAlignment: WrapCrossAlignment.start,
      toolbarIconAlignment: WrapAlignment.start,
      controller: _controller,
      embedButtons: FlutterQuillEmbeds.buttons(
        // provide a callback to enable picking images from device.
        // if omit, "image" button only allows adding images from url.
        // same goes for videos.
        onImagePickCallback: _onImagePickCallback,
        onVideoPickCallback: _onVideoPickCallback,
        // uncomment to provide a custom "pick from" dialog.
        // mediaPickSettingSelector: _selectMediaPickSetting,
        // uncomment to provide a custom "pick from" dialog.
        // cameraPickSettingSelector: _selectCameraPickSetting,
      ),
      showAlignmentButtons: false,
      showCenterAlignment: false,
      afterButtonPressed: state.focusNode.requestFocus,
    );
    if (kIsWeb) {
      toolbar = QuillToolbar.basic(
        multiRowsDisplay: false,
        showFontFamily: false,
        showFontSize: false,
        showSubscript: false,
        toolbarIconCrossAlignment: WrapCrossAlignment.start,
        toolbarIconAlignment: WrapAlignment.start,
        controller: _controller,
        embedButtons: FlutterQuillEmbeds.buttons(
          onImagePickCallback: _onImagePickCallback,
          webImagePickImpl: _webImagePickImpl,
        ),
        showAlignmentButtons: true,
        afterButtonPressed: state.focusNode.requestFocus,
      );
    }
    if (_isDesktop()) {
      toolbar = QuillToolbar.basic(
        multiRowsDisplay: false,
        showFontFamily: false,
        showFontSize: false,
        showSubscript: false,
        toolbarIconCrossAlignment: WrapCrossAlignment.start,
        toolbarIconAlignment: WrapAlignment.start,
        controller: _controller,
        embedButtons: FlutterQuillEmbeds.buttons(
          onImagePickCallback: _onImagePickCallback,
          filePickImpl: openFileSystemPickerForDesktop,
          onVideoPickCallback: _onVideoPickCallback,
        ),
        showAlignmentButtons: true,
        afterButtonPressed: state.focusNode.requestFocus,
      );
    }

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: quillEditor,
            ),
          ),
          kIsWeb
              ? Expanded(
                  child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: toolbar,
                ))
              : Container(child: toolbar)
        ],
      ),
    );
  }

  bool _isDesktop() => !kIsWeb && !Platform.isAndroid && !Platform.isIOS;

  Future<String?> openFileSystemPickerForDesktop(BuildContext context) async {
    var path = await getApplicationDocumentsDirectory();
    return await FilesystemPicker.open(
      context: context,
      rootDirectory: path,
      fsType: FilesystemType.file,
      fileTileSelectMode: FileTileSelectMode.wholeTile,
      showGoUp: true,
      // allowedExtensions: ['.jpg', '.jpeg', '.png', '.bmp', '.gif', '.svg'],
      title: "当前位置" + path.path,
      theme: FilesystemPickerTheme(
        topBar: FilesystemPickerTopBarThemeData(
          backgroundColor: GFColors.DARK,
          titleTextStyle: const TextStyle(color: GFColors.WHITE),
        ),
      ),
    );
  }

  // Renders the image picked by imagePicker from local file storage
  // You can also upload the picked image to any server (eg : AWS s3
  // or Firebase) and then return the uploaded image URL.
  Future<String> _onImagePickCallback(File file) async {
    // Copies the picked file from temporary cache to applications directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile = await file.copy('${appDocDir.path}/${basename(file.path)}');
    debugPrint("图片选择的路径:${copiedFile.path}");
    var uploadUrl = await QiniuUtil.instance.saveFile(file, QiniuFileType.image);
    if (uploadUrl.isNotEmpty) {
      state.insertImages.add(uploadUrl);
      return Qiniu_External_domain + uploadUrl;
    }
    return Future.error("图片上传出错了");
  }

  Future<String?> _webImagePickImpl(OnImagePickCallback onImagePickCallback) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return null;
    }

    // Take first, because we don't allow picking multiple files.
    final fileName = result.files.first.name;
    final file = File(fileName);

    return onImagePickCallback(file);
  }

  // Renders the video picked by imagePicker from local file storage
  // You can also upload the picked video to any server (eg : AWS s3
  // or Firebase) and then return the uploaded video URL.
  Future<String> _onVideoPickCallback(File file) async {
    // Copies the picked file from temporary cache to applications directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile = await file.copy('${appDocDir.path}/${basename(file.path)}');
    debugPrint("视频选择的路径:${copiedFile.path}");
    return QiniuUtil.instance.saveFile(file, QiniuFileType.video);
  }

  Future<MediaPickSetting?> _selectMediaPickSetting(BuildContext context) => showDialog<MediaPickSetting>(
        context: context,
        builder: (ctx) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.collections),
                label: Text('Gallery'.i18n),
                onPressed: () => Navigator.pop(ctx, MediaPickSetting.Gallery),
              ),
              TextButton.icon(
                icon: const Icon(Icons.link),
                label: Text('Link'.i18n),
                onPressed: () => Navigator.pop(ctx, MediaPickSetting.Link),
              )
            ],
          ),
        ),
      );

  // ignore: unused_element
  Future<MediaPickSetting?> _selectCameraPickSetting(BuildContext context) => showDialog<MediaPickSetting>(
        context: context,
        builder: (ctx) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Capture a photo'),
                onPressed: () => Navigator.pop(ctx, MediaPickSetting.Camera),
              ),
              TextButton.icon(
                icon: const Icon(Icons.video_call),
                label: const Text('Capture a video'),
                onPressed: () => Navigator.pop(ctx, MediaPickSetting.Video),
              )
            ],
          ),
        ),
      );

  Widget _buildMenuBar(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const itemStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          thickness: 2,
          color: Colors.white,
          indent: size.width * 0.1,
          endIndent: size.width * 0.1,
        ),
        ListTile(
          title: const Center(child: Text('Read only demo', style: itemStyle)),
          dense: true,
          visualDensity: VisualDensity.compact,
          onTap: _readOnly,
        ),
        Divider(
          thickness: 2,
          color: Colors.white,
          indent: size.width * 0.1,
          endIndent: size.width * 0.1,
        ),
      ],
    );
  }

  void _readOnly() {
    Navigator.pop(super.context);
    Navigator.push(
      super.context,
      MaterialPageRoute(
        builder: (context) => ReadOnlyPage(),
      ),
    );
  }

  Future<String> _onImagePaste(Uint8List imageBytes) async {
    // Saves the image to applications directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final file = await File('${appDocDir.path}/${basename('${DateTime.now().millisecondsSinceEpoch}.png')}').writeAsBytes(imageBytes, flush: true);
    return file.path.toString();
  }

  Future<void> _addEditNote(BuildContext context, {Document? document}) async {
    final isEditing = document != null;
    final quillEditorController = QuillController(
      document: document ?? Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.only(left: 16, top: 8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${isEditing ? 'Edit' : 'Add'} note'),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            )
          ],
        ),
        content: QuillEditor.basic(
          controller: quillEditorController,
          readOnly: false,
        ),
      ),
    );

    if (quillEditorController.document.isEmpty()) return;

    final block = BlockEmbed.custom(
      NotesBlockEmbed.fromDocument(quillEditorController.document),
    );
    final controller = _controller!;
    final index = controller.selection.baseOffset;
    final length = controller.selection.extentOffset - index;

    if (isEditing) {
      final offset = getEmbedNode(controller, controller.selection.start).offset;
      controller.replaceText(offset, 1, block, TextSelection.collapsed(offset: offset));
    } else {
      controller.replaceText(index, length, block, null);
    }
  }
}

class NotesEmbedBuilder extends EmbedBuilder {
  NotesEmbedBuilder({required this.addEditNote});

  Future<void> Function(BuildContext context, {Document? document}) addEditNote;

  @override
  String get key => 'notes';

  @override
  Widget build(
    BuildContext context,
    QuillController controller,
    Embed node,
    bool readOnly,
    bool inline,
  ) {
    final notes = NotesBlockEmbed(node.value.data).document;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          notes.toPlainText().replaceAll('\n', ' '),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        leading: const Icon(Icons.notes),
        onTap: () => addEditNote(context, document: notes),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class NotesBlockEmbed extends CustomBlockEmbed {
  const NotesBlockEmbed(String value) : super(noteType, value);

  static const String noteType = 'notes';

  static NotesBlockEmbed fromDocument(Document document) => NotesBlockEmbed(jsonEncode(document.toDelta().toJson()));

  Document get document => Document.fromJson(jsonDecode(data));
}
