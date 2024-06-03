import 'dart:convert';

import 'CategoryOption.dart';

class Categories {
  String? categoryName;
  String? categoryType;
  String? productId;
  String? id;
  String? chooseMax;

  String? options;

  int selectedCount = 0;
  bool enable = true;

  List<Options> optionsList = [];
  List<Options> optionsListTemp = [];


  Categories(this.categoryName, this.categoryType, this.productId, this.id, this.options, this.chooseMax);

  Categories.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'] ?? false;
    categoryType = json['category_type'] ?? '';
    id = json['id'] ?? '';
    productId = json['product_id'];
    options = (json.containsKey('options') && json['options'] != null) ? json['options'] : '';
    chooseMax = (json.containsKey('choose_max') && json['choose_max'] != null) ? json['choose_max'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['category_type'] = categoryType;
    data['id'] = id;
    data['product_id'] = productId;
    data['options'] = options;
    data['choose_max'] = chooseMax;
    return data;
  }

  static Map<String, dynamic> toMap(Categories music) => {
    'id': music.id,
    'category_name': music.categoryName,
    'category_type': music.categoryType,
    'product_id': music.productId,
    'options': music.options,
    'choose_max': music.chooseMax,
  };

  static String encode(List<Categories> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => Categories.toMap(music))
        .toList(),
  );

  static List<Categories> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Categories>((item) => Categories.fromJson(item))
          .toList();

  @override
  String toString() {
    return 'Categories{categoryName: $categoryName, categoryType: $categoryType, productId: $productId, id: $id, options: $options, choose_max: $chooseMax}';
  }
}
