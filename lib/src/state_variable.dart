/// {@template state_variable}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}

import 'package:equatable/equatable.dart';
import 'package:state_variable/src/enums/enums.dart';

///
abstract class StateVariable<T> extends Equatable {
  /// {@macro state_variable}
  const StateVariable({
    String? error,
    Status status = Status.initial,
    required T value,
  })  : _status = status,
        _value = value,
        _error = error;

  final Status _status;
  final T _value;
  final String? _error;

  ///
  T get value => _value;

  ///
  String? get error => _error;

  ///
  Status get status => _status;

  ///
  String get getDynamicValue {
    switch (_status) {
      case Status.initial:
        return _value.toString();
      case Status.loading:
        return 'Loading';
      case Status.success:
        return _value.toString();
      case Status.failed:
        return 'Failed';
      case Status.refresh:
        return _value.toString();
    }
  }

  //
  ///
  // StateVariable<T> copyWith({Status? status, T? value, String? error});

  ///
  Map<String, dynamic> toJson();

  ///
  Map<String, dynamic> toMap();

  ///
  String toStringJson();

  ///
  StateVariable<T> toInitial([T? value]);

  ///
  StateVariable<T> toLoading([T? value]);

  ///
  StateVariable<T> toRefreshing([T? value]);

  ///
  StateVariable<T> toSuccess([T? value]);

  ///
  StateVariable<T> toFailed([T? value, String? errorMessage]);

  @override
  List<Object?> get props => [_status, _value, _error];
}

///Extension
extension StateVariableExtension<T> on StateVariable<T> {
  ///
  bool get isInitial => _status == Status.initial;

  ///
  bool get isLoading => _status == Status.loading;

  ///
  bool get isRefreshing => _status == Status.loading;

  ///
  bool get isSucceeded => _status == Status.success;

  ///
  bool get isFailed => _status == Status.failed;
}
