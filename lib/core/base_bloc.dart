abstract class BaseBLoc<T> {
  Stream<T> get state;
  void dispose();
}
