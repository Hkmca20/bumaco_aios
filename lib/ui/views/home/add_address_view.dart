import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';

import 'book_order_view.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LunchState();
}

class LunchState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyLightColor,
      appBar: AppbarHome(
        title: "Shipping Address",
      ),
      body: SingleChildScrollView(
        child: initScreen(),
      ),
    );
  }

  Widget initScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // NameEdit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Name", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),

        // Address Line Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Address Line", border: OutlineInputBorder()),
            minLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
          ),
        ),

        // City Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "City", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),

        // Postal Code Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Postal Code", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

        // Phone Number Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Phone Number", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

        // Login Button
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookOrderView()));
                  }, // Click Listener

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              new Color(0xff374ABE),
                              new Color(0xff64B6FF)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 300.0,
                          minHeight: 40.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Add Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ))),
      ],
    );
  }
}
