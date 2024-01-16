part of '../../shared_feature.exports.dart';

class ServicesModel extends Equatable {
  final List<ServiceModel> services;
  const ServicesModel({required this.services});

  @override
  List<Object?> get props => [services];

  factory ServicesModel.fromMap(List<dynamic> list) {
    return ServicesModel(
      services: List<ServiceModel>.from(
        list.map((x) => ServiceModel.fromMap(x)),
      ),
    );
  }
}

class ServiceModel extends Equatable {
  final int id;
  final String mainImage;
  final double price;
  final dynamic discount;
  final double priceAfterDiscount;
  final String title;
  final double averageRating;
  final int completedSalesCount;
  final bool recommended;

  const ServiceModel({
    required this.id,
    required this.mainImage,
    required this.price,
    this.discount,
    required this.priceAfterDiscount,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  @override
  List<Object?> get props => [
        id,
        mainImage,
        price,
        discount,
        priceAfterDiscount,
        title,
        averageRating,
        completedSalesCount,
        recommended,
      ];

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id']?.toInt() ?? 0,
      mainImage: map['main_image'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      discount: map['discount'],
      priceAfterDiscount: map['price_after_discount']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      averageRating: map['average_rating']?.toDouble() ?? 0.0,
      completedSalesCount: map['completed_sales_count']?.toInt() ?? 0,
      recommended: map['recommended'] ?? false,
    );
  }

  ServiceModel copyWith({
    int? id,
    String? mainImage,
    double? price,
    dynamic discount,
    double? priceAfterDiscount,
    String? title,
    double? averageRating,
    int? completedSalesCount,
    bool? recommended,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      mainImage: mainImage ?? this.mainImage,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      title: title ?? this.title,
      averageRating: averageRating ?? this.averageRating,
      completedSalesCount: completedSalesCount ?? this.completedSalesCount,
      recommended: recommended ?? this.recommended,
    );
  }
}
