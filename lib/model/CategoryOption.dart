import 'dart:convert';

class Options {
  bool? optionDefault;
  String? optionName;
  String? optionPrice;
  String? description;
  String? id;
  String? categoryId;

  // Options({
  //   this.optionDefault,
  //   this.optionName,
  //   this.optionPrice,
  //   this.description,
  //   this.id,
  //   this.categoryId
  // });

  Options(this.optionDefault, this.optionName, this.optionPrice, this.description, this.id, this.categoryId);

  Options.fromJson(Map<String, dynamic> json) {
    optionDefault = json['option_default'] ?? false;
    optionName = json['option_name'] ?? '';
    optionPrice = json['option_price'] ?? '';
    description = json['description'] ?? '';
    id = json['id'] ?? '';
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['option_default'] = optionDefault;
    data['option_name'] = optionName;
    data['option_price'] = optionPrice;
    data['description'] = description;
    data['id'] = id;
    data['category_id'] = categoryId;
    return data;
  }

  static Map<String, dynamic> toMap(Options music) => {
    'id': music.id,
    'option_default': music.optionDefault,
    'option_name': music.optionName,
    'option_price': music.optionPrice,
    'description': music.description,
    'category_id': music.categoryId,
  };

  static String encode(List<Options> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => Options.toMap(music))
        .toList(),
  );

  static List<Options> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Options>((item) => Options.fromJson(item))
          .toList();

  @override
  String toString() {
    return 'Options{optionDefault: $optionDefault, optionName: $optionName, optionPrice: $optionPrice, description: $description, id: $id, categoryId: $categoryId}';
  }
}
