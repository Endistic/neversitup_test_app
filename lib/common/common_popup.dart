import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class ShowPopUpCommonDialog {
  showAlertDialog(
    BuildContext context,
    String text,
  ) {
    Widget confirmButton = ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: HexColor('21409A'),
            fixedSize: Size(200.0, 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0))),
        onPressed: () async {
          context.pop();
        },
        child: Text(
          "Close",
          style: TextStyle(color: HexColor('#FFFFFF'), fontSize: 14.0),
        ));

    Dialog alerts = Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), side: BorderSide.none),
        child: Container(
            height: 300,
            width: 300,
            child: Stack(children: <Widget>[
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Product Description",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Description : ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            RichText(
                                text: TextSpan(
                              text: text,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal),
                            ))
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.black,
                            ),
                            Container(
                              child: confirmButton,
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 10.0),
                      // Container(
                      //   child: cancleButton,
                      // )
                    ],
                  ),
                ),
              ),
            ])));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(child: alerts, onWillPop: () async => false);
        });
  }
}
