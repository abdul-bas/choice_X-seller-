
class VariantModel {
  final String sku;
  final String qty;
  final String power;
  final String price;
  final String color;
  final String storage;
  final String discount;
  final List<String> images;

  VariantModel({
    required this.sku,
    required this.qty,
    required this.power,
    required this.price,
    required this.color,
    required this.storage,
    required this.discount,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'qty': qty,
      'power': power,
      'price': price,
      'color': color,
      'storage': storage,
      'discount': discount,
      'images': images,
    };
  }

  factory VariantModel.fromMap(Map<String, dynamic> map) {
    return VariantModel(
      sku: map['sku'] ?? '',
      qty: map['qty'] ?? '',
      power: map['power'] ?? '',
      price: map['price'] ?? '',
      color: map['color'] ?? '',
      storage: map['storage'] ?? '',
      discount: map['discount'] ?? '',
      images: List<String>.from(map['images'] ?? []),
    );
  }
}
