// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxStatus extends StateVariable<Status> {
  ///
  const SxStatus({
    required super.value,
    super.status,
    super.error,
    super.updateAt,
  });

  factory SxStatus.fromMap(Map<String, dynamic> json) {
    return SxStatus(
      value: json['value'] as Status,
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
  SxStatus toInitial([Status? value]) => SxStatus(
        value: value ?? this.value,
      );

  ///
  @override
  SxStatus toLoading([Status? value]) => SxStatus(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///
  @override
  SxStatus toRefreshing([Status? value]) => SxStatus(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxStatus toSuccess([Status? value]) => SxStatus(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxStatus toFailed({Status? value, String? errorMessage}) => SxStatus(
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
