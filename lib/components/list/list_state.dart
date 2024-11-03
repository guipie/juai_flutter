class ListViewState<T> {
  const factory ListViewState.loading() = _Loading<T>;
  const factory ListViewState.empty() = _Empty<T>;
  const factory ListViewState.ready(T data) = _Ready<T>;
  const factory ListViewState.error({required String error}) = _Error<T>;

  const ListViewState._();

  bool get isLoading => this is _Loading<T>;
  bool get isEmpty => this is _Empty<T>;
  bool get isReady => this is _Ready<T>;
  bool get isError => this is _Error<T>;

  T? get data => this is _Ready<T> ? (this as _Ready<T>).data : null;
  String? get error => this is _Error<T> ? (this as _Error<T>).error : null;
}

class _Loading<T> extends ListViewState<T> {
  const _Loading() : super._();
}

class _Empty<T> extends ListViewState<T> {
  const _Empty() : super._();
}

class _Ready<T> extends ListViewState<T> {
  @override
  final T data;

  const _Ready(this.data) : super._();
}

class _Error<T> extends ListViewState<T> {
  @override
  final String error;

  const _Error({required this.error}) : super._();
}
