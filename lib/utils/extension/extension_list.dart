import '../../base.dart';

extension ExtensionList on List? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  Widget toList({required NullableIndexedWidgetBuilder itemBuilder, IndexedWidgetBuilder? separatorBuilder}) {
    if (separatorBuilder != null) {
      return ListView.separated(
        itemBuilder: itemBuilder,
        itemCount: this?.length ?? 0,
        separatorBuilder: separatorBuilder,
      );
    }

    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: this?.length ?? 0,
    );
  }
}
