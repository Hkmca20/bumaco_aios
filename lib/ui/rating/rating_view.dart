import 'package:bumaco_aios/app_utils/app_bar.dart';
import 'package:bumaco_aios/ui/rating/rating_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class RatingView extends StatefulWidget {
  RatingView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  double _rating = 5.0;
  String _currentAnimation = '5+';
  SmileyController _smileyController = SmileyController();

  void _onChanged(double value) {
    if (_rating == value) return;

    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value;
      _currentAnimation = '${value.round()}$direction';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BumacoAppbar(title: widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/rive/happiness_emoji.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                controller: _smileyController,
                animation: _currentAnimation,
              ),
            ),
            Slider(
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: _onChanged,
            ),
            Text(
              '$_rating',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
