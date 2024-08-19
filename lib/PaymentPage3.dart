import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:aps/database.dart';
import 'package:aps/Car.dart';
import 'package:aps/MainPage.dart';

class PaymentPage3 extends StatefulWidget {
  final String slot;
  final int index;
  final double amount;
  const PaymentPage3({required this.slot,required this.index,required this.amount});

  @override
  State<PaymentPage3> createState() => _PaymentPage3State();
}

class _PaymentPage3State extends State<PaymentPage3> {


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
            ElevatedButton(onPressed: (){
              Razorpay razorpay = Razorpay();
              var options = {
                'key': 'rzp_test_k0UHII4Dc4bMl9',
                'amount': widget.amount *100,
                'name': 'APS_Anna_University',
                'description': 'Fine T-Shirt',
                'retry': {'enabled': true, 'max_count': 1},
                'send_sms_hash': true,
                'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                'external': {
                  'wallets': ['paytm']
                }
              };
              razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
              razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
              razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
              razorpay.open(options);
            },
                child: const Text("Pay with Razorpay")),
          ],
        ),
      ),
    );
  }
  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    //Car(String n,String no,String w,String own)
    Car active = new Car(currentUser.getCarAtIndex(widget.index).getCarName(),currentUser.getCarAtIndex(widget.index).getcarNo(),currentUser.getCarAtIndex(widget.index).getWheeler(),currentUser.getCarAtIndex(widget.index).getOwned());
    if(active.isActive == false) {
      active.setIsActive(true);
      currentUser.addActiveCar(active);
      active.setSlot(widget.slot);
      carSlots[widget.slot.codeUnitAt(0) - 'A'.codeUnitAt(0)][int.parse(
          widget.slot[1]) - 0] = true;
      active.setAmount(widget.amount);
    }
      showAlertDialog(
          context, "Payment Successful", "Payment ID: ${response.paymentId}");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(), ));


  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
