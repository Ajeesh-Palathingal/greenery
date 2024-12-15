import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenery/api/data/Url.dart';
import 'package:greenery/controllers/auction_controller.dart';
import 'package:greenery/core/constants/constants.dart';
import 'package:greenery/models/bid_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../widgets/custom_appbar_widget.dart';

class MakeABid extends StatefulWidget {
   MakeABid({super.key, required this.auctionId});
  final String auctionId;
AuctionController auctionController = Get.put(AuctionController());
  @override
  _MakeABidState createState() => _MakeABidState();
}

class _MakeABidState extends State<MakeABid> {
  late IO.Socket _socket;
  final TextEditingController _bidController = TextEditingController();
  
  List<BidModel> _bidders = [];

  @override
  void initState() {
    AuctionController auctionController = AuctionController();
    auctionController.getBids(widget.auctionId);
    super.initState();
    _initializeSocket();
  }

  Future<void> _initializeSocket() async {
    final sharedPref = await SharedPreferences.getInstance();
    final authorization = sharedPref.getString(TOKEN);

    _socket = IO.io(
      "${Url().baseUrl}auction",
      IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
          {'authorization': authorization}).build(),
    );

    _socket.on('connect', (_) {
      print('Connected to auction socket');
    });
    _socket.on('ready', (_) {
      print('Socket is ready');
    });
    _socket.emit('joinAuction', {'auctionId': widget.auctionId});

    _socket.on('bidUpdated', (data) {
      log(data.toString());
      _handleNewBid(data);
    });

    _socket.on('bidError', (error) {
      _showErrorDialog('$error');
    });

    _socket.connect();
  }

  void _handleNewBid(dynamic bidData) {
    final newBid = BidModel.fromJson(bidData);
    log("new ${newBid}");
    _bidders.add(newBid);
    _bidders.sort((a, b) => b.bidAmount!.compareTo(a.bidAmount ?? 0));

    log(_bidders.toString());
  }

  void _placeBid(double bidAmount) {
    _socket.emit('placeBid', {
      'auctionId': widget.auctionId,
      'bidAmount': bidAmount,
    });
  }

  void _quickBid(double increment) {
    if (_bidders.isNotEmpty) {
      final currentBid = _bidders.first.bidAmount;
      final newBidAmount = currentBid;
      _bidController.text = newBidAmount.toStringAsFixed(2);
    } else {
      _bidController.text = increment.toString();
    }
  }

  void _showErrorDialog(dynamic message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _socket.dispose();
    _bidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Make a bid",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Participate in current product bidding',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(() {
                      print(widget.auctionController.bidsList);
                      return widget.auctionController.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: widget.auctionController.bidsList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Text(widget.auctionController.bidsList[index].fullName)
                                  ],
                                );
                              }),
                          );
                    }),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBidButton('+₹100', () => _quickBid(100)),
                        _buildBidButton('+₹200', () => _quickBid(200)),
                        _buildBidButton('+₹500', () => _quickBid(500)),
                        _buildBidButton('+₹1000', () => _quickBid(1000)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _bidController,
                    decoration: InputDecoration(
                      hintText: 'Enter bid amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  final bidAmount = double.tryParse(_bidController.text);
                  if (bidAmount != null) {
                    _placeBid(bidAmount);
                  } else {
                    _showErrorDialog('Invalid bid amount');
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green[800],
                  backgroundColor: Colors.green[200],
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Make a bid'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBidItem(String number, String name, String amount,
      {bool isHighlighted = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isHighlighted ? Colors.green[100] : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isHighlighted ? Colors.white : Colors.green[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 32,
                height: 32,
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(name),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBidButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.green[800],
        backgroundColor: Colors.green[200],
        minimumSize: const Size(64, 48),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
