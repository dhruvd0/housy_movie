import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housy_movie/loginStateNotifier.dart';
import 'package:housy_movie/movieList.dart';
import 'package:provider/provider.dart';

var loginKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Consumer<LoginStateNotifier>(
        builder: (_, loginState, __) => Form(
          key: loginKey,
          child: Column(
            
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text("Log In",style: TextStyle(fontSize: 30)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  validator: (str) {
                    return str == null || str.length == 0 ? 'invalid' : null;
                  },
                  onChanged: (str) {
                    loginState.changeName(str);
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
                    loginState.changePassword(str);
                  },
                  decoration: InputDecoration(hintText: "Password"),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (loginKey.currentState?.validate() ?? false) {
                    bool val = await loginState.validate();
                    if (val) {
                      Navigator.of(context).push(
                          CupertinoPageRoute(builder: (_) => MovieList()));
                    } else {
                      Fluttertoast.showToast(msg: "Invalid Credentials");
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Text("Login",style:TextStyle(color:Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
