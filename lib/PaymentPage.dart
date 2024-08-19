import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:aps/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:aps/SecondScreen.dart';
import 'package:aps/database.dart';
import 'package:aps/AddVehicle.dart';
import 'package:aps/MainPage.dart';
import 'package:aps/my_flutter_app_icons.dart';
import 'payment_config.dart';
import 'package:pay/pay.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late GooglePayButton googlePayButton;


  @override
  void initState() {
    super.initState();
    googlePayButton = GooglePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
      paymentItems: const [
        PaymentItem(label: 'Total', amount: '10', status: PaymentItemStatus.final_price),
      ],
      width: double.infinity,
      type: GooglePayButtonType.pay,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) => debugPrint('Payment Result $result'),
      loadingIndicator: const Center(child: CircularProgressIndicator()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Center(
          child: googlePayButton,
        ),
      ),
    );
  }
}