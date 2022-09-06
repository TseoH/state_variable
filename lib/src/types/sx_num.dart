// ignore_for_file: public_member_api_docs
import 'dart:convert';
import 'package:state_variable/src/enums/enums.dart';
import 'package:state_variable/src/state_variable.dart';

class SxNum extends StateVariable<num> {
  ///
  const SxNum({
    required super.value,
    super.status,
    super.error,
    super.updateAt,
  });

  factory SxNum.fromMap(Map<String, dynamic> json) {
    return SxNum(
      value: json['value'] as num,
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
  SxNum toInitial([num? value]) => SxNum(
        value: value ?? this.value,
      );

  ///
  @override
  SxNum toLoading([num? value]) => SxNum(
        value: value ?? this.value,
        status: Status.loading,
        updateAt: updateAt,
      );

  ///
  @override
  SxNum toRefreshing([num? value]) => SxNum(
        value: value ?? this.value,
        status: Status.refresh,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxNum toSuccess([num? value]) => SxNum(
        value: value ?? this.value,
        status: Status.success,
        updateAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

  ///
  @override
  SxNum toFailed({num? value, String? errorMessage}) => SxNum(
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
