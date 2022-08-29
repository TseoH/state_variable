// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxStatus extends StateVariable<Status> {
  ///
  const SxStatus({required super.value, super.status, super.error});

  factory SxStatus.fromMap(Map<String, dynamic> json) {
    return SxStatus(
      value: json['value'] as Status,
      status: Status.values[json['status'] as int],
      error: json['error'] as String?,
    );
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
  SxStatus toInitial([Status? value]) => SxStatus(
        value: value ?? this.value,
      );

  ///
  @override
  SxStatus toLoading([Status? value]) => SxStatus(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  SxStatus toRefreshing([Status? value]) => SxStatus(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  SxStatus toSuccess([Status? value]) => SxStatus(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  @override
  SxStatus toFailed({Status? value, String? errorMessage}) => SxStatus(
        value: value ?? this.value,
        status: Status.failed,
        error: errorMessage,
      );

  @override
  String toString() {
    return 'StateVariable('
        'status: $status, '
        'value: $value, '
        'hasError:'
        '${(error != null && (error?.isNotEmpty)!) || isFailed})';
  }
}
