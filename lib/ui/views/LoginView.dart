import 'package:dahdi/ui/viewModel/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginView> {
  var data = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(data.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 0),
                child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('lib/ui/images/png-logo-bird-twitter-image-2.png'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'User name',
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/post');
                },
                child: const Text('Login'),
              ),
              TextButton(
                  onPressed: () {}, child: const Text("you don't have account"))
            ],
          ),
        ),
      ),
    );
  }
}
