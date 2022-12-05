import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String id;
  const DetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome On Dahdi App"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("the Post Id is $id"),
              TextButton(
                onPressed: () {
                  context.go("/login");
                },
                child: const Text('go to login Scene'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


