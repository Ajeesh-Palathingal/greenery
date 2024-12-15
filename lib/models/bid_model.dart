class BidModel {
  final String auctionId;
  final String bidderName;
  // final String? bidderEmail;
  final double amount;
  // final DateTime timestamp;

  BidModel({
    required this.auctionId,
    required this.bidderName,
    //  this.bidderEmail,
    required this.amount,
    // required this.timestamp,
  });

  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      auctionId: json['auctionId'],
      bidderName: json['fullName'],
      amount: json['bidAmount'].toDouble(),
    );
  }
}
