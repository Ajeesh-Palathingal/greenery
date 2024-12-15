class BidModel {
  final String auctionId;
  final double bidAmount;
  final String fullName;
  final String userId;

  // Constructor
  BidModel({
    required this.auctionId,
    required this.bidAmount,
    required this.fullName,
    required this.userId,
  });

  // Factory method to create a BidModel from JSON
  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      auctionId: json['auctionId'] as String,
      bidAmount: (json['bidAmount'] as num).toDouble(),
      fullName: json['fullName'] as String,
      userId: json['userId'] as String,
    );
  }

  // Method to convert BidModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'auctionId': auctionId,
      'bidAmount': bidAmount,
      'fullName': fullName,
      'userId': userId,
    };
  }
}
