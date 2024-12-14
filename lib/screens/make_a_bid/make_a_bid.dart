import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

import '../widgets/custom_appbar_widget.dart';

class MakeABidScreen extends StatelessWidget {
  const MakeABidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Make a bid",
      ),
      body: Column(
        children: [
          // Scrollable content
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
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        _buildBidItem('01', 'Sangeeth', '\$10.00'),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 18,
                          endIndent: 18,
                        ),
                        _buildBidItem('02', 'Samalex', '\$9.00'),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 18,
                          endIndent: 18,
                        ),
                        _buildBidItem('03', 'Chikku', '\$8.00'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildBidItem('06', 'You', '\$6.00', isHighlighted: true),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBidButton('+\$1'),
                      _buildBidButton('+\$2'),
                      _buildBidButton('+\$5'),
                      _buildBidButton('+\$10'),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter bid amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button fixed at the bottom
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomElevatedButton(onPressed: (){}, label: "Make a bid")
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
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(name),
            ],
          ),
          Text(
            amount,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBidButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.green[800],
        backgroundColor: Colors.green[200],
        minimumSize: Size(64, 48),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
