import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:greenery/controllers/auction_controller.dart';
import 'package:greenery/controllers/payment_controller.dart';
import 'package:greenery/screens/auction/auction_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay _razorpay;

  PaymentController paymentController = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clear all listeners
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success: ${response.paymentId}');

    String _signature = response.data!['razorpay_signature'];
    String _orderId = response.data!['razorpay_order_id'];
    String _paymentId = response.data!['razorpay_payment_id'];

    paymentController.verifyPayment(_orderId, _signature, _paymentId);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment Successful!')),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.code} | ${response.message}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment Failed! Please try again.')),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('External Wallet Selected: ${response.walletName}')),
    );
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_MFdeM2Q5rlybCY', // Replace with your Razorpay Key
      'amount':
          50000, // Amount in the smallest currency unit (e.g., 50000 for ₹500.00)
      'name': 'Your App Name',
      'description': 'Payment for order #1234',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com',
      },
      'theme': {
        'color': '#F37254',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: openCheckout,
          child: Text('Proceed to Pay'),
        ),
      ),
    );
  }
}
