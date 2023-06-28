import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:juai/pages/bbs/publish/widgets/article/widgets/readonly_scaffold.dart';

import 'universal_ui/universal_ui.dart';

class ReadOnlyPage extends StatefulWidget {
  final String source;
  const ReadOnlyPage({super.key, required this.source});
  @override
  _ReadOnlyPageState createState() => _ReadOnlyPageState();
}

class _ReadOnlyPageState extends State<ReadOnlyPage> {
  final FocusNode _focusNode = FocusNode();

  bool _edit = false;

  @override
  Widget build(BuildContext context) {
    return Readonlycaffold(
      source: widget.source,
      builder: _buildContent,
      // showToolbar: _edit == true,
      // floatingActionButton: FloatingActionButton.extended(label: Text(_edit == true ? 'Done' : 'Edit'), onPressed: _toggleEdit, icon: Icon(_edit == true ? Icons.check : Icons.edit)),
    );
  }

  Widget _buildContent(BuildContext context, QuillController? controller) {
    var quillEditor = QuillEditor(
      minHeight: 300,
      controller: controller!,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: _focusNode,
      autoFocus: true,
      readOnly: !_edit,
      expands: false,
      padding: EdgeInsets.zero,
      embedBuilders: FlutterQuillEmbeds.builders(),
    );
    if (kIsWeb) {
      quillEditor = QuillEditor(controller: controller, scrollController: ScrollController(), scrollable: true, focusNode: _focusNode, autoFocus: true, readOnly: !_edit, expands: false, padding: EdgeInsets.zero, embedBuilders: defaultEmbedBuildersWeb);
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: quillEditor,
    );
  }

  void _toggleEdit() {
    setState(() {
      _edit = !_edit;
    });
  }
}
