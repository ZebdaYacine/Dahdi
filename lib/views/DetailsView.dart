import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<StatefulWidget> createState() {
    return DetailsState();
  }
}

class DetailsState extends State<DetailsView> {
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
              const Text('Home Scene'),
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
