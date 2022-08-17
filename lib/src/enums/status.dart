extension StatusExtension on Status {
  //
  Status toggleToInitial() => Status.initial;
  Status toggleToLoading() => Status.loading;
  Status toggleToRefreshing() => Status.refresh;
  Status toggleToFailed() => Status.failed;
  Status toggleToSuccess() => Status.success;
  //
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isRefreshing => this == Status.refresh;
  bool get isSucceeded => this == Status.success;
  bool get isFailed => this == Status.failed;
}

enum Status { initial, loading, success, failed, refresh }
