import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('LoginView'),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Container(
          width: 350.0,
          height: 250.0,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            border: new Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child:
          Column(
            children: [
              SizedBox(height: 50.0),
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.black)
                      ),
                    ),
                  ),
              ),

              SizedBox(height: 15.0),

              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.black)
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
