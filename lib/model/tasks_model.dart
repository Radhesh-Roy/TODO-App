class TasksModel {
  final int? id;
  final String task;
  final bool isComplete;

  TasksModel({this.id, required this.task, required this.isComplete});

  Map<String, dynamic>toMap(){
    return {
      "id": id,
      "title": task,
      "isComplete": isComplete ? 1 : 0,
    };
  }

  factory TasksModel.formMap(Map<String, dynamic>maps){
    return TasksModel(
      id: maps["id"],
      task: maps["title"],
      isComplete: maps["isComplete"]==1
    );
  }

}