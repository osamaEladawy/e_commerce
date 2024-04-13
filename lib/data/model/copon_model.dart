class CoponModel {
  int? coponId;
  String? coponName;
  int? coponCount;
  int? coponDiscount;
  String? coponExpairdate;

  CoponModel(
      {this.coponId,
        this.coponName,
        this.coponCount,
        this.coponDiscount,
        this.coponExpairdate});

  CoponModel.fromJson(Map<String, dynamic> json) {
    coponId = json['copon_id'];
    coponName = json['copon_name'];
    coponCount = json['copon_count'];
    coponDiscount = json['copon_discount'];
    coponExpairdate = json['copon_expairdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copon_id'] = this.coponId;
    data['copon_name'] = this.coponName;
    data['copon_count'] = this.coponCount;
    data['copon_discount'] = this.coponDiscount;
    data['copon_expairdate'] = this.coponExpairdate;
    return data;
  }
}