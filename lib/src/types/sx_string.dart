// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxString extends StateVariable<String> {
  ///
  const SxString({required super.value, super.status, super.error});

  @override
  StateVariable<String> fromJson(Map<String, dynamic> json) {
    return SxString(
      value: json['value'] as String,
      status: Status.values[json['status'] as int],
      error: json['error'] as String,
    );
  }

  @override
  StateVariable<String> fromMap(Map<String, dynamic> map) {
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
  SxString toInitial([String? value]) => SxString(
        value: value ?? this.value,
      );

  ///
  @override
  SxString toLoading([String? value]) => SxString(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  SxString toRefreshing([String? value]) => SxString(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  SxString toSuccess([String? value]) => SxString(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  @override
  SxString toFailed([String? value, String? errorMessage]) => SxString(
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
