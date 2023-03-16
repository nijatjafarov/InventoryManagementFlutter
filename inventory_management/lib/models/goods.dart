const String tableGoods = 'goods';

class GoodsFields {
  static final List<String> values = [

    id, name, measurementUnit, quantity, purchasePrice, salesPrice
  ];

  static const String id = '_id';
  static const String name = 'name';
  static const String measurementUnit = 'measurementUnit';
  static const String quantity = 'quantity';
  static const String purchasePrice = 'purchasePrice';
  static const String salesPrice = 'salesPrice';
}

class Goods {
  final int? id;
  final String name;
  final String measurementUnit;
  final double quantity;
  final double purchasePrice;
  final double? salesPrice;

  const Goods({
    this.id,
    required this.name,
    required this.measurementUnit,
    required this.quantity,
    required this.purchasePrice,
    this.salesPrice,
  });

  Goods copy({
    int? id,
    String? name,
    String? measurementUnit,
    double? quantity,
    double? purchasePrice,
    double? salesPrice
  }) =>
      Goods(
        id: id ?? this.id,
        name: name ?? this.name,
        measurementUnit: measurementUnit ?? this.measurementUnit,
        quantity: quantity ?? this.quantity,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        salesPrice: salesPrice ?? this.salesPrice,
      );

  static Goods fromJson(Map<String, Object?> json) => Goods(
        id: json[GoodsFields.id] as int?,
        name: json[GoodsFields.name] as String,
        measurementUnit: json[GoodsFields.measurementUnit] as String,
        quantity: json[GoodsFields.quantity] as double,
        purchasePrice: json[GoodsFields.purchasePrice] as double,
        salesPrice: json[GoodsFields.salesPrice] as double,
      );

  Map<String, Object?> toJson() => {
        GoodsFields.id: id,
        GoodsFields.name: name,
        GoodsFields.measurementUnit: measurementUnit,
        GoodsFields.quantity: quantity,
        GoodsFields.purchasePrice: purchasePrice,
        GoodsFields.salesPrice: salesPrice,
      };
}