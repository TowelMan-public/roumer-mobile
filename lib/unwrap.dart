T unwrapNull<T>(T? value) {
  if (value == null) {
    throw NullThrownError();
  } else {
    return value;
  }
}
