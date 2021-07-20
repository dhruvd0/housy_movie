import 'package:flutter/material.dart';
import 'package:housy_movie/login.dart';
import 'package:housy_movie/loginStateNotifier.dart';
import 'package:housy_movie/movieList.dart';
import 'package:housy_movie/register.dart';
import 'package:housy_movie/registerStateNotifier.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MaterialApp(home: Auth()));
}

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterStateNotifier()),
          ChangeNotifierProvider(create: (_) => LoginStateNotifier())
        ],
        child: MaterialApp(
          home: AuthPageView(),
         
        ));
  }
}

class AuthPageView extends StatelessWidget {
   AuthPageView({
    Key? key,
  }) : super(key: key);
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: LayoutBuilder(
        builder: (_, size) {
          return Container(
            height: size.maxHeight,
            width: size.maxWidth,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  top: size.maxHeight / 4,
                  child: Container(
                    width: size.maxWidth,
                    height: size.maxHeight,
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Register(
                          pageController: pageController,
                          width: size.maxWidth,
                        ),
                        Login(
                          width: size.maxWidth,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
