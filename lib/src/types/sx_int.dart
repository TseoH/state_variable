// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxInt extends StateVariable<int> {
  ///
  const SxInt({
    required super.value,
    super.status,
    super.error,
    super.updateAt,
  });

  factory SxInt.fromMap(Map<String, dynamic> json) {
    return SxInt(
      value: json['value'] as int,
      status: Status.values[json['status'] as int],
      error: json['error'] as String?,
      updateAt: json['updateAt'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'error': error ?? '',
      'status': status.index,
      'updateAt': updateAt,
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
  SxInt toInitial([int? value]) => SxInt(
        value: value ?? this.value,
      );

  ///
  @override
  SxInt toLoading([int? value]) => SxInt(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///
  @override
  SxInt toRefreshing([int? value]) => SxInt(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxInt toSuccess([int? value]) => SxInt(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxInt toFailed({int? value, String? errorMessage}) => SxInt(
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
}
