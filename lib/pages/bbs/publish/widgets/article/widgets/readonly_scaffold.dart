import 'dart:convert';
import 'dart:io';

import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:path_provider/path_provider.dart';

typedef DemoContentBuilder = Widget Function(BuildContext context, QuillController? controller);

// Common scaffold for all examples.
class Readonlycaffold extends StatefulWidget {
  const Readonlycaffold({
    required this.source,
    required this.builder,
    this.actions,
    this.showToolbar = true,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  /// Filename of the document to load into the editor.
  final String source;
  final DemoContentBuilder builder;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showToolbar;

  @override
  _ReadonlycaffoldState createState() => _ReadonlycaffoldState();
}

class _ReadonlycaffoldState extends State<Readonlycaffold> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  QuillController? _controller;

  bool _loading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller == null && !_loading) {
      _loading = true;
      _loadFromAssets();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _loadFromAssets() async {
    try {
      final doc = Document.fromJson(jsonDecode(widget.source));
      setState(() {
        _controller = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
        _loading = false;
      });
    } catch (error) {
      final doc = Document()..insert(0, 'Empty asset');
      setState(() {
        _controller = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
        _loading = false;
      });
    }
  }

  Future<String?> openFileSystemPickerForDesktop(BuildContext context) async {
    return await FilesystemPicker.open(
      context: context,
      rootDirectory: await getApplicationDocumentsDirectory(),
      fsType: FilesystemType.file,
      fileTileSelectMode: FileTileSelectMode.wholeTile,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Scaffold(body: Center(child: Text('Loading...')));
    }
    final actions = widget.actions ?? <Widget>[];
    var toolbar = QuillToolbar.basic(
      controller: _controller!,
      embedButtons: FlutterQuillEmbeds.buttons(),
    );
    if (_isDesktop()) {
      toolbar = QuillToolbar.basic(
        controller: _controller!,
        embedButtons: FlutterQuillEmbeds.buttons(filePickImpl: openFileSystemPickerForDesktop),
      );
    }
    return _loading ? const Center(child: Text('Loading...')) : widget.builder(context, _controller);
  }

  bool _isDesktop() => !kIsWeb && !Platform.isAndroid && !Platform.isIOS;
}
