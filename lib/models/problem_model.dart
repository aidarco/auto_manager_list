class ProblemModel {
   String? id;
   String? description;

  ProblemModel({required this.id, required this.description});

  ProblemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }
}
