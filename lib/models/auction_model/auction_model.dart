import 'package:json_annotation/json_annotation.dart';

part 'auction_model.g.dart';

@JsonSerializable()
class AuctionModel {
  @JsonKey(name: '_id')
  final String id;

  final String productName;
  final String description;
  final int startingBid;
  final int highestBid;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> images;
  final PaymentStatus payment;

  @JsonKey(name: '__v')
  final int version;

  final CreatedBy createdBy;

  AuctionModel({
    required this.id,
    required this.productName,
    required this.description,
    required this.startingBid,
    required this.highestBid,
    required this.startTime,
    required this.endTime,
    required this.images,
    required this.payment,
    required this.version,
    required this.createdBy,
  });

  factory AuctionModel.fromJson(Map<String, dynamic> json) =>
      _$AuctionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuctionModelToJson(this);

  AuctionModel copyWith({
    String? id,
    String? productName,
    String? description,
    int? startingBid,
    int? highestBid,
    DateTime? startTime,
    DateTime? endTime,
    List<String>? images,
    PaymentStatus? payment,
    int? version,
    CreatedBy? createdBy,
  }) {
    return AuctionModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      startingBid: startingBid ?? this.startingBid,
      highestBid: highestBid ?? this.highestBid,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      images: images ?? this.images,
      payment: payment ?? this.payment,
      version: version ?? this.version,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}

@JsonSerializable()
class PaymentStatus {
  final String status;

  PaymentStatus({required this.status});

  factory PaymentStatus.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentStatusToJson(this);

  PaymentStatus copyWith({
    String? status,
  }) {
    return PaymentStatus(
      status: status ?? this.status,
    );
  }
}

@JsonSerializable()
class CreatedBy {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  final String email;

  CreatedBy({
    required this.id,
    required this.fullName,
    required this.email,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);

  CreatedBy copyWith({
    String? id,
    String? fullName,
    String? email,
  }) {
    return CreatedBy(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }
}
