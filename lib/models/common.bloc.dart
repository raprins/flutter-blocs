class CommonEvent<T> {
  final T type;
  final dynamic payload;

  CommonEvent({required this.type, this.payload});
}
