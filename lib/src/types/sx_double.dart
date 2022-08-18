// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxDouble extends StateVariable<double> {
  ///
  const SxDouble({required super.value, super.status, super.error});

  @override
  StateVariable<double> fromJson(Map<String, dynamic> json) {
    return SxDouble(
      value: json['value'] as double,
      status: Status.values[json['status'] as int],
      error: json['error'] as String,
    );
  }

  @override
  StateVariable<double> fromMap(Map<String, dynamic> map) {
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
  SxDouble toInitial([double? value]) => SxDouble(
        value: value ?? this.value,
      );

  ///
  @override
  SxDouble toLoading([double? value]) => SxDouble(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  SxDouble toRefreshing([double? value]) => SxDouble(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  SxDouble toSuccess([double? value]) => SxDouble(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  @override
  SxDouble toFailed([double? value, String? errorMessage]) => SxDouble(
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
