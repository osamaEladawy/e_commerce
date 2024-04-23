class UsersModel {
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  int? usersVerfiy;
  int? usersApprove;
  String? usersCreate;
  String? usersImage;

  UsersModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPassword,
      this.usersPhone,
      this.usersVerfiy,
      this.usersApprove,
      this.usersCreate,
      this.usersImage});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersPhone = json['users_phone'];
    usersVerfiy = json['users_verfiy'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersImage = json['users_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_password'] = usersPassword;
    data['users_phone'] = usersPhone;
    data['users_verfiy'] = usersVerfiy;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    data['users_image'] = usersImage;
    return data;
  }
}