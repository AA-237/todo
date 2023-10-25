import '../../../common/models/todo_model.dart';

abstract class TodoEvents {
  const TodoEvents();
}

class TitleEvent extends TodoEvents {
  final String title;

  TitleEvent(this.title);
}

class DescriptionEvent extends TodoEvents {
  final String desc;

  DescriptionEvent(this.desc);
}
