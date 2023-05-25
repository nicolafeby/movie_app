import 'dart:async';

class ValidatorHelper {
  static StreamTransformer<String, String> validateRequired =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      value.isEmpty ? sink.addError('must be filled') : sink.add(value);
    },
  );
}
