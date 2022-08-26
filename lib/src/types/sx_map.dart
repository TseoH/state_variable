// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxMap<T, P> extends StateVariable<Map<T, P>> {
  ///
  const SxMap({required super.value, super.status, super.error});

  factory SxMap.fromMap(Map<String, dynamic> json) {
    return SxMap(
      value: json['value'] as Map<T, P>,
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
  SxMap<T, P> toInitial([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
      );

  ///
  @override
  SxMap<T, P> toLoading([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  SxMap<T, P> toRefreshing([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  SxMap<T, P> toSuccess([Map<T, P>? value]) => SxMap<T, P>(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  @override
  SxMap<T, P> toFailed({Map<T, P>? value, String? errorMessage}) => SxMap<T, P>(
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
