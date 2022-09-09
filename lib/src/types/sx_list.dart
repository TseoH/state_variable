// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxList<T> extends StateVariable<List<T>> {
  ///
  const SxList({
    required super.value,
    super.status,
    super.error,
    super.updateAt,
  });

  factory SxList.fromMap(Map<String, dynamic> json) {
    return SxList(
      value: json['value'] as List<T>,
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

  ///Return a [SxList] with a status that
  ///is equals to [Status.initial].
  ///
  ///If [value] is not null, current value will
  ///be updated.
  ///
  ///[Map], [List] and [String] implementation have
  ///[clear] method that return an initial [status] equal to
  ///[Status.initial] with default value of the mentioned [Type].
  ///
  ///To know if [status] is equals to [Status.initial], directly
  /// use [isInitial] getter.
  @override
  SxList<T> toInitial([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
      );

  ///Return a [SxList] with a status that
  ///is equals to [Status.loading].
  ///
  ///If [value] is not null, current value will
  ///be updated.
  ///
  ///To know if [status] is equals to [Status.loading], directly
  ///use [isLoading] getter.
  @override
  SxList<T> toLoading([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///Return a [SxList] with a status that
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
  SxList<T> toRefreshing([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///Return a [SxList] with a status that
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
  SxList<T> toSuccess([List<T>? value]) => SxList<T>(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  SxList<T> clear([List<T>? value]) => SxList<T>(
        value: value ?? [],
      );

  ///Return a [SxList] with a status that
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
  SxList<T> toFailed({List<T>? value, String? errorMessage}) => SxList<T>(
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
