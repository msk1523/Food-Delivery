import 'dart:convert';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery/service/database.dart';
import 'package:food_delivery/service/shared_pref.dart';
import 'package:food_delivery/widget/app_constant.dart';
import 'package:food_delivery/widget/widget_support.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  TextEditingController amountController = new TextEditingController();
  getthesharedpref() async {
    wallet = await SharedPreferenceHelper().getUserWallet();
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: wallet == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.blue,
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(
                          "Wallet",
                          style: AppWidget.headlineTextFieldStyle(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(color: Colors.blue.shade400),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Image.asset('images/wallet.png', width: 60, height: 60),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Wallet",
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Balance: ${wallet!}/-",
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Add Money",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          makePayment('100');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            '100/-',
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      GestureDetector(
                        onTap: () {
                          makePayment('200');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            '200/-',
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      GestureDetector(
                        onTap: () {
                          makePayment('500');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            '500/-',
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      GestureDetector(
                        onTap: () {
                          makePayment('1000');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            '1000/-',
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      openEdit();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Add Money",
                        style: AppWidget.boldTextFieldStyle(),
                      )),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'MSK Food-Chain',
            ),
          )
          .then((value) {});
      displayPaymentSheet(amount);
    } catch (e, s) {
      print('exception: $e , $s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        add = int.parse(wallet!) + int.parse(amount);
        await SharedPreferenceHelper().saveUserWallet(add.toString());
        await DatabaseMethods().UpdateUserWallet(
            id!, add.toString()); //updating the wallet in firestore
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          Text('Payment Successful'),
                        ],
                      )
                    ],
                  ),
                ));
        await getthesharedpref();
        // await usergetprofile();
        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('error is----> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('error is----> $e ');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text('Cancelled'),
              ));
    } catch (e) {
      print('error is----> $e ');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer $secretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body);
      print('Payment Intent Body ->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err changing user: ${err.toString()} ');
    }
  }

  calculateAmount(String amount) {
    final calculateAmount = int.parse(amount) * 100;
    return calculateAmount.toString();
  }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.cancel)),
                        SizedBox(width: 40),
                        Center(
                            child: Text(
                          "Add Money",
                          style: TextStyle(
                              color: Color(0xFF008080),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: amountController,
                        decoration: InputDecoration(
                            hintText: "Enter Amount", border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        makePayment(amountController.text);
                      },
                      child: Center(
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFF008080),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Pay",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
