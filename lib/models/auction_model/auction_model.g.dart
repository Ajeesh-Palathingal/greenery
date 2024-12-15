// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuctionModel _$AuctionModelFromJson(Map<String, dynamic> json) => AuctionModel(
      id: json['_id'] as String,
      productName: json['productName'] as String,
      description: json['description'] as String,
      startingBid: (json['startingBid'] as num).toInt(),
      highestBid: (json['highestBid'] as num).toInt(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      payment: PaymentStatus.fromJson(json['payment'] as Map<String, dynamic>),
      version: (json['__v'] as num).toInt(),
      createdBy: CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuctionModelToJson(AuctionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'productName': instance.productName,
      'description': instance.description,
      'startingBid': instance.startingBid,
      'highestBid': instance.highestBid,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'images': instance.images,
      'payment': instance.payment,
      '__v': instance.version,
      'createdBy': instance.createdBy,
    };

PaymentStatus _$PaymentStatusFromJson(Map<String, dynamic> json) =>
    PaymentStatus(
      status: json['status'] as String,
    );

Map<String, dynamic> _$PaymentStatusToJson(PaymentStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
    };
