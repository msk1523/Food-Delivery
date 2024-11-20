import 'package:flutter/material.dart';
import 'package:food_delivery/pages/chat_bot.dart';
import 'package:food_delivery/pages/details.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/widget/widget_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image.asset(
                      "images/logo.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatBot()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.chat_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hello Siva!",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Text(
                "Delicious Food",
                style: AppWidget.headlineTextFieldStyle(),
              ),
              Text("Discover and Get Great Food!",
                  style: AppWidget.lightTextFieldStyle()),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      icecream = true;
                      pizza = false;
                      burger = false;
                      salad = false;
                      setState(() {});
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: icecream ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "images/ice-cream.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          color: icecream ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      icecream = false;
                      pizza = false;
                      burger = true;
                      salad = false;
                      setState(() {});
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: burger ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "images/burger.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          color: burger ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      icecream = false;
                      pizza = true;
                      burger = false;
                      salad = false;
                      setState(() {});
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: pizza ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "images/pizza.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          color: pizza ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      icecream = false;
                      pizza = false;
                      burger = false;
                      salad = true;
                      setState(() {});
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: salad ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "images/salad.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          color: salad ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/salad2.png",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "Veggie Taco Hash",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Fresh and Healthy",
                                  style: AppWidget.lightTextFieldStyle(),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "250/-",
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_pin,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "2km",
                                          style: AppWidget
                                              .semiBoldTextFieldStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/salad3.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Veggie Mix Bowl",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Fresh and Healthy",
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "250/-",
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "2km",
                                        style:
                                            AppWidget.semiBoldTextFieldStyle(),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/pizza2.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Mixed Veg Pizza",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Crispy and Tasty",
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "300/-",
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "1km",
                                        style:
                                            AppWidget.semiBoldTextFieldStyle(),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                // margin: EdgeInsets.only(right: 3, left: 3),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/pizza3.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Farmhouse Pizza",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Veggies and yummy cheese",
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "280/-",
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "2.2km",
                                        style:
                                            AppWidget.semiBoldTextFieldStyle(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
