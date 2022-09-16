import 'package:equatable/equatable.dart';
import 'package:state_variable/src/enums/enums.dart';

/// Here is the contract class that define the default
/// Sealed Variable aka [StateVariable] behavior.

abstract class StateVariable<T> extends Equatable {
  ///
  const StateVariable({
    String? error,
    Status status = Status.initial,
    int? updateAt,
    required T value,
  })  : _status = status,
        _value = value,
        _updateAt = updateAt,
        _error = error;

  ///
  final Status _status;
  final T _value;
  final String? _error;
  final int? _updateAt;

  ///Get the current value of type [T]
  T get value => _value;

  ///Get error message if there is any.
  ///Error message is define when value is
  ///updating as [toFailed].
  String? get error => _error;

  ///Get the current variable's status.
  ///Status can be any of these : [Status.initial],
  ///[Status.loading], [Status.success], [Status.refresh]
  /// or [Status.failed].
  Status get status => _status;

  ///Return the last (datetime as millisecondsSinceEpoch)
  ///value has been updated
  ///has [toSuccess] or [toRefreshing].
  int? get updateAt => _updateAt;

  ///Debug usage
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

  ///
  bool get isInitial => status.isInitial;

  ///
  bool get isLoading => status.isLoading;

  ///
  bool get isRefreshing => status.isRefreshing;

  ///
  bool get isSucceeded => status.isSucceeded;

  ///
  bool get isFailed => status.isFailed;

  ///
  Map<String, dynamic> toJson();

  ///
  Map<String, dynamic> toMap();

  ///
  String toStringJson();

  ///Return a StateVariable with a status that
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
  StateVariable<T> toInitial([T? value]);

  ///Return a StateVariable with a status that
  ///is equals to [Status.loading].
  ///
  ///If [value] is not null, current value will
  ///be updated.
  ///
  ///To know if [status] is equals to [Status.loading], directly
  ///use [isLoading] getter.
  StateVariable<T> toLoading([T? value]);

  ///Return a StateVariable with a status that
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
  StateVariable<T> toRefreshing([T? value]);

  ///Return a StateVariable with a status that
  ///is equals to [Status.success].
  ///
  ///If [value] is not null, current value will
  ///be updated. Here, mostly, we recommend to set value when you
  ///invoke [toSuccess], it's make sense unless
  ///it's StateVariable<Status> aka SxStatus.
  ///
  ///To know if [status] is equals to [Status.success], directly
  ///use [isSucceeded] getter.
  StateVariable<T> toSuccess([T? value]);

  ///Return a StateVariable with a status that
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
  StateVariable<T> toFailed({T? value, String? errorMessage});

  @override
  List<Object?> get props => [_status, _value, _error, _updateAt];
}
