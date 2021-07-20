import 'dart:async';

import 'package:flutter/material.dart';
import 'package:housy_movie/registerStateNotifier.dart';
import 'package:provider/provider.dart';

final formKey = GlobalKey<FormState>();

class Register extends StatelessWidget {
  Register({Key? key, required this.width, required this.pageController})
      : super(key: key);
  final double width;
  PageController pageController;
  @override
  Widget build(BuildContext context) {
    RegisterStateNotifier registerState =
        Provider.of<RegisterStateNotifier>(context, listen: false);
    return Container(
      width: width,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: (str) {
                  return str == null || str.length == 0 ? 'invalid' : null;
                },
                onChanged: (str) {
                  registerState.changeField(str, RegisterFields.name);
                },
                decoration: InputDecoration(hintText: "Name"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: true,
                validator: (str) {
                  return str == null || str.length == 0 ? 'invalid' : null;
                },
                onChanged: (str) {
                  registerState.changeField(str, RegisterFields.password);
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: (str) {
                  return str == null || str.length == 0 ? 'invalid' : null;
                },
                onChanged: (str) {
                  registerState.changeField(str, RegisterFields.email);
                },
                decoration: InputDecoration(hintText: "Email"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (str) {
                  return str == null || str.length == 0 ? 'invalid' : null;
                },
                onChanged: (str) {
                  registerState.changeField(str, RegisterFields.email);
                },
                decoration: InputDecoration(hintText: "Phone"),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonFormField<String>(
                 hint: Text("Profession"),
               onChanged: (str){
                  
               },
                  items: [
                    DropdownMenuItem(
                        value: "Software Developer",
                        child: Text("Software Developer")),
                    DropdownMenuItem(
                        value: "Gardener", child: Text("Gardener")),
                    DropdownMenuItem(value: "Chef", child: Text("Chef"))
                  ],
                )),
            Center(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        registerState.register();
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child: Text("Register", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
