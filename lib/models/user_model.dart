class UserModel {
  int? id;
  String? name;
  String? gender;
  String? email;
  String? status;

  UserModel({this.id, this.email, this.gender, this.name, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    email = json['email'];
    status = json['status'];
  }

  UserModel copyWith(
    int? id,
    String? name,
    String? gender,
    String? email,
    String? status,
  ) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }
}
