extension MapExtensions on Map<String, dynamic> {
  Map<String, dynamic> copyWiths({
    Map<String, dynamic>? updates,
  }) {
    final newMap = Map<String, dynamic>.of(this);
    if (updates != null) {
      newMap.addAll(updates);
    }
    return newMap;
  }

  Map<String, dynamic> copyWith(String key, dynamic val) {
    final newMap = Map<String, dynamic>.of(this);
    newMap.addAll({key: val});
    return newMap;
  }
}
