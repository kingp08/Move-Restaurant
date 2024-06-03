import 'dart:convert';

import 'CategoryOption.dart';

class CategoryModel {
  String? categoryName;
  String? categoryType;
  String? productId;
  String? id;
  String? chooseMax;

  CategoryModel(this.categoryName, this.categoryType, this.productId, this.id, this.chooseMax);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'] ?? false;
    categoryType = json['category_type'] ?? '';
    id = json['id'] ?? '';
    productId = json['product_id'];
    chooseMax = (json.containsKey('choose_max') && json['choose_max'] != null) ? json['choose_max'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['category_type'] = categoryType;
    data['id'] = id;
    data['product_id'] = productId;
    data['choose_max'] = chooseMax;
    return data;
  }

  static Map<String, dynamic> toMap(CategoryModel music) => {
    'id': music.id,
    'category_name': music.categoryName,
    'category_type': music.categoryType,
    'product_id': music.productId,
    'choose_max': music.chooseMax,
  };
}
