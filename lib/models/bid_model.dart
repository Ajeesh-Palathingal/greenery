class BidModel {
  final String id;
  final String auctionId;
  final String bidderName;
  final String? bidderEmail;
  final double amount;
  final DateTime timestamp;

  BidModel({
    required this.id,
    required this.auctionId,
    required this.bidderName,
     this.bidderEmail,
    required this.amount,
    required this.timestamp,
  });

  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      id: json['_id'],
      auctionId: json['auction'],
      bidderName: json['bidder']['fullName'],
      bidderEmail: json['bidder']['email']??'',
      amount: json['amount'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
