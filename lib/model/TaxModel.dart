class TaxModel {
  String? taxLable;
  bool? taxActive;
  int? taxAmount;
  String? taxType;

  TaxModel({this.taxLable, this.taxActive, this.taxAmount, this.taxType});

  TaxModel.fromJson(Map<String, dynamic> json) {
    int taxVal = 0;
    if (json['tax_active'] != null && json['tax_active']) {
      if (json.containsKey('tax_amount') && json['tax_amount'] != null) {
        if (json['tax_amount'] is int) {
          taxVal = json['tax_amount'];
        } else if (json['tax_amount'] is String) {
          taxVal = int.parse(json['tax_amount']);
        }
      }
      taxLable = json['tax_lable'];
      taxActive = json['tax_active'];
      taxAmount = taxVal;
      taxType = json['tax_type'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax_lable'] = this.taxLable;
    data['tax_active'] = this.taxActive;
    data['tax_amount'] = this.taxAmount;
    data['tax_type'] = this.taxType;
    return data;
  }
}
