/// {@template state_variable}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}

import 'package:equatable/equatable.dart';
import 'package:state_variable/src/enums/enums.dart';

///
class StateVariable<T> extends Equatable {
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
  StateVariable<T> copyWith({
    Status? status,
    T? value,
    String? error,
  }) {
    return StateVariable<T>(
      status: status ?? _status,
      value: value ?? _value,
      error: error ?? _error,
    );
  }

  @override
  String toString() {
    return 'StateVariable{status: $_status, '
        'value: $_value, '
        'hasError: ${_error != null && (_error?.isNotEmpty)!}';
  }

  @override
  List<Object?> get props => [_status, _value];
}

//Type
///
typedef SvString = StateVariable<String>;

///
typedef SvInt = StateVariable<int>;

///
typedef SvDouble = StateVariable<double>;

///
typedef SvBool = StateVariable<bool>;

///
typedef SvList<T> = StateVariable<List<T>>;

///
typedef Sv<T> = StateVariable<T>;

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

  ///
  StateVariable<T> toInitial([T? value]) => StateVariable<T>(
        value: value ?? _value,
      );

  ///
  StateVariable<T> toLoading([T? value]) => StateVariable<T>(
        value: value ?? _value,
        status: Status.loading,
      );

  ///
  StateVariable<T> toRefreshing([T? value]) => StateVariable<T>(
        value: value ?? _value,
        status: Status.refresh,
      );

  ///
  StateVariable<T> toSuccess([T? value]) => StateVariable<T>(
        value: value ?? _value,
        status: Status.success,
      );

  ///
  StateVariable<T> toFailed([
    T? value,
  ]) =>
      StateVariable<T>(
        value: value ?? _value,
        status: Status.failed,
      );
}

///
extension StateVariableStringExtension on String {
  ///
  SvString get sv => SvString(value: this);
}

///
extension StateVariableIntExtension on int {
  ///
  SvInt get sv => SvInt(value: this);
}

///
extension StateVariableDoubleExtension on double {
  ///
  SvDouble get sv => SvDouble(value: this);
}

///
extension StateVariableBoolExtension on bool {
  ///
  SvBool get sv => SvBool(value: this);
}

///
extension StateVariableObject<T> on T {
  ///
  Sv<T> get sv => Sv<T>(value: this);
}
