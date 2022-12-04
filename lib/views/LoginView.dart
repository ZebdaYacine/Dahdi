import 'package:dahdi/viewModel/loginViewModel.dart';
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
  var data =  LoginViewModel();
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
              Text('${data.getCounter()}'),
              ElevatedButton(
                  onPressed: (){
                    context.go("post");
                    setState(() {
                      //data.inc();
                    });
                  },
                  child: const Icon(Icons.add)
              ),
              /*const Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 30),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User name',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 30),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/home');
                },
                child: const Text('go to home Scene'),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
