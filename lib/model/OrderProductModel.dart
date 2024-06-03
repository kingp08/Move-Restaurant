import 'package:foodie_restaurant/constants.dart';
import 'package:foodie_restaurant/model/variant_info.dart';

class OrderProductModel {
  dynamic extras;
  dynamic variantInfo;
  String? extrasPrice;
  String id;
  String name;
  String photo;
  String price;
  String discountPrice;
  int quantity;
  int availableQuantity;
  String vendorID;
  String categoryId;
  String productCategories;
  String notes;
  bool delivered;
  String competitor;
  String confirmation;

  OrderProductModel(
      {this.id = '',
      this.photo = '',
      this.price = '',
      this.name = '',
      this.quantity = 0,
      this.availableQuantity = 0,
      this.vendorID = '',
      this.extras = const [],
      this.extrasPrice = "",
      this.variantInfo,
      this.categoryId = '',
      this.discountPrice = '',
      this.productCategories = '',
      this.notes = '',
      this.delivered = true,
      this.competitor = "",
      this.confirmation = "",
      });

  factory OrderProductModel.fromJson(Map<String, dynamic> parsedJson) {
    dynamic extrasVal;
    if (parsedJson['extras'] == null) {
      extrasVal = List<String>.empty();
    } else {
      if (parsedJson['extras'] is String) {
        if (parsedJson['extras'] == '[]') {
          extrasVal = List<String>.empty();
        } else {
          String extraDecode = parsedJson['extras'].toString().replaceAll("[", "").replaceAll("]", "").replaceAll("\"", "");
          if (extraDecode.contains(",")) {
            extrasVal = extraDecode.split(",");
          } else {
            extrasVal = [extraDecode];
          }
        }
      }
      if (parsedJson['extras'] is List) {
        extrasVal = parsedJson['extras'].cast<String>();
      }
    }

    int quanVal = 0;
    if (parsedJson['quantity'] == null || parsedJson['quantity'] == double.nan || parsedJson['quantity'] == double.infinity) {
      quanVal = 0;
    } else {
      if (parsedJson['quantity'] is String) {
        quanVal = int.parse(parsedJson['quantity']);
      } else {
        quanVal = (parsedJson['quantity'] is double) ? (parsedJson["quantity"].isNaN ? 0 : (parsedJson['quantity'] as double).toInt()) : parsedJson['quantity'];
      }
    }
    int availableQuantity = 0;
    if (parsedJson['availableQuantity'] == null || parsedJson['availableQuantity'] == double.nan || parsedJson['availableQuantity'] == double.infinity) {
      availableQuantity = 0;
    } else {
      if (parsedJson['availableQuantity'] is String) {
        availableQuantity = int.parse(parsedJson['availableQuantity']);
      } else {
        availableQuantity = (parsedJson['availableQuantity'] is double) ? (parsedJson["availableQuantity"].isNaN ? 0 : (parsedJson['availableQuantity'] as double).toInt()) : parsedJson['availableQuantity'];
      }
    }
    return new OrderProductModel(
      id: parsedJson['id'] ?? '',
      photo: parsedJson['photo'] == '' ? placeholderImage : parsedJson['photo'],
      price: parsedJson['price'] ?? '0.0',
      discountPrice: parsedJson['discountPrice'] ?? '0.0',
      quantity: quanVal,
      availableQuantity: availableQuantity == 0 ? quanVal : availableQuantity,
      name: parsedJson['name'] ?? '',
      vendorID: parsedJson['vendorID'] ?? '',
      categoryId: parsedJson['category_id'] ?? '',
      extras: extrasVal,
      extrasPrice: parsedJson["extras_price"] != null ? parsedJson["extras_price"] : "",
      variantInfo: (parsedJson.containsKey('variant_info') && parsedJson['variant_info'] != null) ? VariantInfo.fromJson(parsedJson['variant_info']) : null,
      productCategories: (parsedJson.containsKey('productCategories') && parsedJson['productCategories'] != null) ? parsedJson['productCategories'] : '',
      notes: (parsedJson.containsKey('notes') && parsedJson['notes'] != null) ? parsedJson['notes'] : '',
      delivered: (parsedJson.containsKey('delivered') && parsedJson['delivered'] != null) ? parsedJson['delivered'] : true,
      competitor: (parsedJson.containsKey('competitor') && parsedJson['competitor'] != null) ? parsedJson['competitor'] : "",
      confirmation: (parsedJson.containsKey('confirmation') && parsedJson['confirmation'] != null) ? parsedJson['confirmation'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'photo': this.photo,
      'price': this.price,
      'discountPrice': this.discountPrice,
      'name': this.name,
      'quantity': this.quantity,
      'availableQuantity': this.availableQuantity,
      'vendorID': this.vendorID,
      'category_id': this.categoryId,
      "extras": this.extras,
      "extras_price": this.extrasPrice,
      "productCategories": this.productCategories,
      "notes": this.notes,
      "delivered": this.delivered,
      "competitor": this.competitor,
      "confirmation": this.confirmation,
      'variant_info': variantInfo != null ? variantInfo!.toJson() : null,
    };
  }
}
