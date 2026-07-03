class TasksModel {
  final int? id;
  final String task;
  final bool isComplete;

  TasksModel({this.id, required this.task, required this.isComplete});

  Map<String, dynamic>toMap(){
    return {
      "id": id,
      "task": task,
      "isComplete": isComplete,
    };
  }

}