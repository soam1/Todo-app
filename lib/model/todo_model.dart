class TodoModel {
  // {id: 1, title: dsa, time: 10pm, description: 3 striver ques daily, favorite: 0, completed: 0}
  final int id;
  final String title;
  final String description;
  final String time;
  final int favorite;
  final int completed;

  TodoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.time,
      required this.favorite,
      required this.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        time: json['time'],
        favorite: json['favorite'],
        completed: json['completed']);
  }
}
