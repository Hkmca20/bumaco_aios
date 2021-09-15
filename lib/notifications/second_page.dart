import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String payload;

  const SecondPage({
    Key? key,
    required this.payload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Second page - Payload:',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 8),
              Text(
                payload,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 8),
              RaisedButton(
                child: Text('Back'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
}