import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_state.freezed.dart';

@freezed
class ListViewState<T> with _$ListViewState<T> {
  const factory ListViewState.loading() = Loading;
  const factory ListViewState.empty() = Empty;
  const factory ListViewState.ready(T data) = Ready<T>;
  const factory ListViewState.error({required String error}) = Error;
}
