// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxBool extends StateVariable<bool> {
  ///
  const SxBool({
    required super.value,
    super.status,
    super.error,
    super.updateAt,
  });

  factory SxBool.fromMap(Map<String, dynamic> json) {
    return SxBool(
      value: json['value'] as bool,
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
  SxBool toInitial([bool? value]) => SxBool(
        value: value ?? this.value,
      );

  ///
  @override
  SxBool toLoading([bool? value]) => SxBool(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///
  @override
  SxBool toRefreshing([bool? value]) => SxBool(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxBool toSuccess([bool? value]) => SxBool(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxBool toFailed({bool? value, String? errorMessage}) => SxBool(
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
        'updateAt: $updateAt'
        'hasError:'
        '${(error != null && (error?.isNotEmpty)!) || isFailed})';
  }
}
