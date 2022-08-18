// ignore_for_file: public_member_api_docs, avoid_dynamic_calls
// no_runtimetype_tostring

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class Sx<T> extends StateVariable<T> {
  ///
  const Sx({required super.value, super.status, super.error});

  factory Sx.fromMap(Map<String, dynamic> json) {
    return Sx(
      value: json['value'] as T,
      status: Status.values[json['status'] as int],
      error: json['error'] as String?,
    );
  }

  T _fromJson(Map<String, dynamic> json) {
    final onThrow = UnimplementedError('$runtimeType need to implement '
        'a factory or method with exact name like fromJson or fromMap');
    final data = json['value'] as Map<String, dynamic>;
    try {
      return (T as dynamic).fromJson(data) as T;
    } catch (_) {
      try {
        return (T as dynamic).fromMap(data) as T;
      } catch (_) {
        try {
          return (this as dynamic).fromJson(data) as T;
        } catch (_) {
          try {
            return (this as dynamic).fromMap(data) as T;
          } catch (_) {
            throw onThrow;
          }
        }
      }
    }
  }

  @override
  StateVariable<T> fromJson(Map<String, dynamic> json) {
    return Sx(
      value: _fromJson(json),
      status: Status.values[json['status'] as int],
      error: json['error'] as String,
    );
  }

  @override
  StateVariable<T> fromMap(Map<String, dynamic> map) {
    return fromJson(map);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'error': error ?? '',
      'status': status.index,
    };
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }

  @override
  String toStringJson() {
    return json.encode(toJson());
  }

  ///
  @override
  Sx<T> toInitial([T? value]) => Sx(
        value: value ?? this.value,
      );

  ///
  @override
  Sx<T> toLoading([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  Sx<T> toRefreshing([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  Sx<T> toSuccess([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  @override
  Sx<T> toFailed([T? value, String? errorMessage]) => Sx(
        value: value ?? this.value,
        status: Status.failed,
        error: errorMessage,
      );

  @override
  String toString() {
    return 'StateVariable('
        'status: $this.status, '
        'value: $value, '
        'hasError:'
        '${(error != null && (error?.isNotEmpty)!) || isFailed})';
  }

  @override
  List<Object?> get props => super.props;
}
