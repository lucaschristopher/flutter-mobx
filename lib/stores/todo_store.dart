import 'package:mobx/mobx.dart';
part 'todo_store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  final String title;

  @observable
  bool done = false;

  _TodoStoreBase(this.title);
  
  @action
  void toogleDone() => done = !done;
}