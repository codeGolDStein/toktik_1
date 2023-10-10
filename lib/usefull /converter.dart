class Convert {
  static String futureToString(Future<String> future) {
    String result = '';
    future.then((value) {
      result = value;
    });
    return result;
  }
}
