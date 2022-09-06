// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxList<T> extends StateVariable<List<T>> {
  ///
  const SxList({required super.value, super.status, super.error});

  factory SxList.fromMap(Map<String, dynamic> json) {
    return SxList(
      value: json['value'] as List<T>,
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
  SxList<T> toInitial([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
      );

  ///
  @override
  SxList<T> toLoading([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  SxList<T> toRefreshing([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  SxList<T> toSuccess([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  SxList<T> clear([List<T>? value]) => SxList<T>(
        value: value ?? [],
      );

  ///
  @override
  SxList<T> toFailed({List<T>? value, String? errorMessage}) => SxList<T>(
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

  @override
  List<Object?> get props => super.props;
}
