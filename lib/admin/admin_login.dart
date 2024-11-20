import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/admin/home_admin.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/widget/widget_support.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                padding: EdgeInsets.only(top: 45, left: 20, right: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red.shade400, Colors.blue.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(
                            MediaQuery.of(context).size.width, 110))),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 70),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Text(
                          "Helloo Admin!",
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: TextFormField(
                                      controller: usernameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter Username";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle:
                                            AppWidget.hintTextFieldStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: TextFormField(
                                      controller: passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter Password";
                                        }
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            AppWidget.hintTextFieldStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    LoginAdmin();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: AppWidget.boldTextFieldStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: Text(
                                      "Just a User? Click here",
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((element) {
        if (element.data()["id"] != usernameController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text("Invalid Username"))));
        } else if (element.data()["password"] != passwordController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text("Invalid Password"))));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text("Login Success"))));
          Route route = MaterialPageRoute(builder: (context) => AdminHome());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
