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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_phone'] = this.usersPhone;
    data['users_verfiy'] = this.usersVerfiy;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['users_image'] = this.usersImage;
    return data;
  }
}