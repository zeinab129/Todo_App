class TaskModel {

  static String collectionName = "Tasks";

  String? id;
  String? title;
  String? description;
  int? date;
  bool? isDone;

  TaskModel({this.id = "",
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false});


  TaskModel.fromJson(Map<String, dynamic> json):this(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      isDone: json['isDone']
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone,
    };
  }

}
