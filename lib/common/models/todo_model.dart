// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final String title;
  final String desc;
  final int id;
   bool isCompleted;
  final String startDate;
  final String endDate;

  TodoModel(
    this.title,
    this.desc,
    this.id,
    this.isCompleted,
    this.startDate,
    this.endDate,
  );


  TodoModel copyWith({
    String? title,
    String? desc,
    int? id,
    bool? isCompleted,
    String? startDate,
    String? endDate,
  }) {
    return TodoModel(
      title ?? this.title,
      desc ?? this.desc,
      id ?? this.id,
      isCompleted ?? this.isCompleted,
      startDate ?? this.startDate,
      endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'desc': desc,
      'id': id,
      'isCompleted': isCompleted,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      map['title'] as String,
      map['desc'] as String,
      map['id'] as int,
      map['isCompleted'] as bool,
      map['startDate'] as String,
      map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(title: $title, desc: $desc, id: $id, isCompleted: $isCompleted, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.desc == desc &&
      other.id == id &&
      other.isCompleted == isCompleted &&
      other.startDate == startDate &&
      other.endDate == endDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      desc.hashCode ^
      id.hashCode ^
      isCompleted.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
  }
}
