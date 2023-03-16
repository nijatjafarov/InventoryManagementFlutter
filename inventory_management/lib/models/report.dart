const String tableReports = 'report';

class ReportFields {
  static final List<String> values = [
    /// Add all fields
    id, date, purchaseAmount, salesAmount, benefit
  ];

  static const String id = '_id';
  static const String date = 'date';
  static const String purchaseAmount = 'purchaseAmount';
  static const String salesAmount = 'salesAmount';
  static const String benefit = 'benefit';
}

class Report {
  final int? id;
  final DateTime date;
  final double purchaseAmount;
  final double salesAmount;
  final double benefit;

  const Report({
    this.id,
    required this.date,
    required this.purchaseAmount,
    required this.salesAmount,
    required this.benefit
  });

  Report copy({
    int? id,
    DateTime? date,
    double? purchaseAmount,
    double? salesAmount,
    double? benefit
  }) =>
      Report(
        id: id ?? this.id,
        date: date ?? this.date,
        purchaseAmount: purchaseAmount ?? this.purchaseAmount,
        salesAmount: salesAmount ?? this.salesAmount,
        benefit: benefit ?? this.benefit,
      );

  static Report fromJson(Map<String, Object?> json) => Report(
        id: json[ReportFields.id] as int?,
        date: DateTime.parse(json[ReportFields.date] as String),
        purchaseAmount: json[ReportFields.purchaseAmount] as double,
        salesAmount: json[ReportFields.salesAmount] as double,
        benefit: json[ReportFields.benefit] as double,
      );

  Map<String, Object?> toJson() => {
        ReportFields.id: id,
        ReportFields.date: date.toIso8601String(),
        ReportFields.purchaseAmount: purchaseAmount,
        ReportFields.salesAmount: salesAmount,
        ReportFields.benefit: benefit,
      };
}