import 'dart:async';

/// A value that can be watched as a stream. Each new listener first gets
/// the current value, then every change. Used by the mock repositories to
/// behave like a live backend.
class LiveValue<T> {
  LiveValue(this._value);

  T _value;
  final _changes = StreamController<T>.broadcast();

  T get value => _value;

  set value(T next) {
    _value = next;
    if (!_changes.isClosed) _changes.add(next);
  }

  Stream<T> get stream => Stream.multi((listener) {
    listener.add(_value);
    final sub = _changes.stream.listen(
      listener.add,
      onError: listener.addError,
      onDone: listener.close,
    );
    // Don't return the cancel future: `.first` waits on it, and under the
    // fake clock of widget tests it never completes.
    listener.onCancel = () {
      sub.cancel();
    };
  });

  Future<void> close() => _changes.close();
}
