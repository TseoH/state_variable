// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxInt extends StateVariable<int> {
  ///
  const SxInt({required super.value, super.status, super.error});

  @override
  StateVariable<int> fromJson(Map<String, dynamic> json) {
    return SxInt(
      value: json['value'] as int,
      status: Status.values[json['status'] as int],
      error: json['error'] as String,
    );
  }

  @override
  StateVariable<int> fromMap(Map<String, dynamic> map) {
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
  SxInt toInitial([int? value]) => SxInt(
        value: value ?? this.value,
      );

  ///
  @override
  SxInt toLoading([int? value]) => SxInt(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  SxInt toRefreshing([int? value]) => SxInt(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  SxInt toSuccess([int? value]) => SxInt(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  @override
  SxInt toFailed([int? value, String? errorMessage]) => SxInt(
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
