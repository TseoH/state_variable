///
T getTFromJson<T>(Map<String, dynamic> json) {
  final onThrow = UnimplementedError('$T need to implement '
      'a factory or method with exact name like fromJson or fromMap');
  final data = json['value'];
  try {
    return (T as dynamic).fromJson(data) as T;
  } catch (_) {
    try {
      return (T as dynamic).fromMap(data) as T;
    } catch (_) {
      throw onThrow;
    }
  }
}
