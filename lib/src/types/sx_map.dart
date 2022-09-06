// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxMap<T, P> extends StateVariable<Map<T, P>> {
  ///
  const SxMap({
    required super.value,
    super.status,
    super.error,
    super.updateAt,
  });

  factory SxMap.fromMap(Map<String, dynamic> json) {
    return SxMap(
      value: json['value'] as Map<T, P>,
      status: Status.values[json['status'] as int],
      error: json['error'] as String?,
      updateAt: json['updateAt'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'error': error ?? '',
      'status': status.index,
      'updateAt': updateAt,
    };
  }

  @override
  String toStringJson() {
    return json.encode(toJson());
  }

  ///
  @override
  SxMap<T, P> toInitial([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
      );

  ///
  @override
  SxMap<T, P> toLoading([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///
  @override
  SxMap<T, P> toRefreshing([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxMap<T, P> toSuccess([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  SxMap<T, P> clear([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? {},
      );

  ///
  @override
  SxMap<T, P> toFailed({Map<T, P>? value, String? errorMessage}) => SxMap<T, P>(
        value: value ?? this.value,
        status: Status.failed,
        error: errorMessage,
        updateAt: updateAt,
      );

  @override
  String toString() {
    return 'StateVariable('
        'status: $status, '
        'value: $value, '
        'updateAt: $updateAt, '
        'hasError:'
        '${(error != null && (error?.isNotEmpty)!) || isFailed})';
  }

  @override
  List<Object?> get props => super.props;
}
