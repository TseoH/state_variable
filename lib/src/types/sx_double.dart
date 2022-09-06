// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxDouble extends StateVariable<double> {
  ///
  const SxDouble({
    required super.value,
    super.status,
    super.error,
    super.updateAt,
  });

  factory SxDouble.fromMap(Map<String, dynamic> json) {
    return SxDouble(
      value: json['value'] as double,
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
  SxDouble toInitial([double? value]) => SxDouble(
        value: value ?? this.value,
      );

  ///
  @override
  SxDouble toLoading([double? value]) => SxDouble(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///
  @override
  SxDouble toRefreshing([double? value]) => SxDouble(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxDouble toSuccess([double? value]) => SxDouble(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxDouble toFailed({double? value, String? errorMessage}) => SxDouble(
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
