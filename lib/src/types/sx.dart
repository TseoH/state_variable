// ignore_for_file: public_member_api_docs, avoid_dynamic_calls
// no_runtimetype_tostring

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/helpers/helpers.dart';
import 'package:state_variable/src/state_variable.dart';

class Sx<T> extends StateVariable<T> {
  ///
  const Sx({
    required super.value,
    super.status,
    super.error,
  });

  factory Sx.fromJson(
    Map<String, dynamic> json, {
    required T Function(JsonMap json) decoder,
  }) {
    return Sx(
      value: decoder(json['value'] as JsonMap),
      status: Status.values[json['status'] as int],
      error: json['error'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson({JsonMap Function()? encoder}) {
    return {
      'value': encoder ?? (value as dynamic).toJson(),
      'error': error ?? '',
      'status': status.index,
    };
  }

  @override
  Map<String, dynamic> toMap({JsonMap Function()? encoder}) {
    return toJson(encoder: encoder);
  }

  @override
  String toStringJson() {
    return json.encode(toJson());
  }

  ///
  @override
  Sx<T> toInitial([T? value]) => Sx(
        value: value ?? this.value,
      );

  ///
  @override
  Sx<T> toLoading([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.loading,
      );

  ///
  @override
  Sx<T> toRefreshing([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.refresh,
      );

  ///
  @override
  Sx<T> toSuccess([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.success,
      );

  ///
  @override
  Sx<T> toFailed([T? value, String? errorMessage]) => Sx(
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
