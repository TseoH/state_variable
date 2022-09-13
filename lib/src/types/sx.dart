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
    super.updateAt,
  });

  ///Sx.fromJson factory expose a [decoder] that's required
  ///to set a new Sx from Map<String, dynamic> aka json.
  ///[decoder] is the fromJson or fromMap factory of your Object,
  ///example : Sx<TestClass>.fromJson(json, decoder: TestClass.fromJson).
  ///The [decoder] expose a dynamic [value] that should be most of time
  ///a Map<String, dynamic> or a List<Map<String, dynamic>>.
  factory Sx.fromJson(
    Map<String, dynamic> json, {
    required T Function(dynamic value) decoder,
  }) {
    return Sx(
      value: decoder(json['value']),
      status: Status.values[json['status'] as int],
      error: json['error'] as String,
      updateAt: json['updateAt'] as int?,
    );
  }

  ///[toJson] method expose an optional [encoder] to set
  ///your object as Map<String, dynamic>. If you don't
  /// parse any encoder, be sure that your object has a
  /// toJson method, otherwise an NoSuchMethodException will be
  /// throw.
  @override
  Map<String, dynamic> toJson({dynamic Function(T value)? encoder}) {
    return {
      'value': encoder != null ? encoder(value) : (value as dynamic).toJson(),
      'error': error ?? '',
      'status': status.isLoading ? status.isInitial : status.index,
      'updateAt': updateAt,
    };
  }

  ///Same as [toJson], just name preference
  @override
  Map<String, dynamic> toMap({dynamic Function(T value)? encoder}) {
    return toJson(encoder: encoder);
  }

  @override
  String toStringJson({JsonMap Function(T value)? encoder}) {
    return json.encode(toJson(encoder: encoder));
  }

  ///Return a Sx<T> with a status that
  ///is equals to [Status.initial].
  ///
  ///If [value] is not null, current value will
  ///be updated.
  ///
  ///[Map], [List] and [String] implementation have
  ///clear method that return an initial [status] equal to
  ///[Status.initial] with default value of the mentioned [Type].
  ///
  ///To know if [status] is equals to [Status.initial], directly
  /// use [isInitial] getter.
  @override
  Sx<T> toInitial([T? value]) => Sx(
        value: value ?? this.value,
      );

  ///Return a Sx<T> with a status that
  ///is equals to [Status.loading].
  ///
  ///If [value] is not null, current value will
  ///be updated.
  ///
  ///To know if [status] is equals to [Status.loading], directly
  ///use [isLoading] getter.
  @override
  Sx<T> toLoading([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///Return a Sx<T> with a status that
  ///is equals to [Status.refresh].
  ///
  ///If [value] is not null, current value will
  ///be updated.
  ///
  ///To know if [status] is equals to [Status.refresh], directly
  ///use [isRefreshing] getter.
  ///
  ///Prefer using [toRefreshing] method, if it's not the first time
  ///you process the current value otherwise, use [toLoading] instead.
  @override
  Sx<T> toRefreshing([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///Return a Sx<T> with a status that
  ///is equals to [Status.success].
  ///
  ///If [value] is not null, current value will
  ///be updated. Here, mostly, we recommend to set value when you
  ///invoke [toSuccess], it's make sense unless
  ///it's StateVariable<Status> aka SxStatus.
  ///
  ///To know if [status] is equals to [Status.success], directly
  ///use [isSucceeded] getter.
  @override
  Sx<T> toSuccess([T? value]) => Sx(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///Return a Sx<T> with a status that
  ///is equals to [Status.failed].
  ///
  ///If [value] is not null, current value will
  ///be updated.
  ///
  ///[toFailed] method has an additional parameter
  ///that's optional too, it's [errorMessage]. errorMessage
  ///is accessible with the [error] getter.
  ///
  ///To know if [status] is equals to [Status.failed], directly
  ///use [isFailed] getter.
  @override
  Sx<T> toFailed({T? value, String? errorMessage}) => Sx(
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
