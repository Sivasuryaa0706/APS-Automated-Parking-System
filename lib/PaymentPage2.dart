import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage2 extends StatefulWidget {
  const PaymentPage2({Key? key}) : super(key: key);

  @override
  State<PaymentPage2> createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _addListeners();
  }

  void _addListeners() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void initiatePayment() {
    var options = {
      'key': 'rzp_test_k0UHII4Dc4bMl9',
      'amount': 5000, // 50 in the smallest currency unit (e.g., cents)
      'name': 'Acme Corp.',
      'order_id': 'order_EMBFqjDHEEn80l', // Fetch/order ID securely
      'description': 'Fine T-Shirt',
      'timeout': 60,
      'prefill': {
        'contact': '9360212098',
        'email': 'gaurav.kumar@example.com'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // Show an error to the user in a user-friendly way
      debugPrint("Payment failed: ${e.toString()}");
    }
  }

  // UI implementation for the Scaffold body to show payment details
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Display Payment Information Here'),
            ElevatedButton(
              onPressed: () {
                initiatePayment();
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }

  // Implement response handling functions
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Update UI or perform actions on successful payment
    // For example, show a success message to the user
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure - display an error message to the user
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet response
  }
}
