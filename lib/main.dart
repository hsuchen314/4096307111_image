import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('flutter_button'),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
  );


  var i=0;
  var imageList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: buildInkWellContainer1(context),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: _elevatedButton2(context),
                ),
                Container(
                  child: _elevatedButton1(context),
                )
              ],
            )
          )
        ],
      ),
    );
  }


  ElevatedButton _elevatedButton1(BuildContext context){
    return ElevatedButton(
        style: buttonStyle,
        onPressed: (){
          if(i<3) {
            imageList[i] = imageList[i + 1];
          }else{
            i=0;
          }
        },
        child: const Text('next')
    );
  }
  ElevatedButton _elevatedButton2(BuildContext context){
    return ElevatedButton(
        style: buttonStyle,
        onPressed: (){
          if(i>0) {
            imageList[i] = imageList[i - 1];
          }else {
            i = 3;
          }
        },
        child: const Text('last')
    );
  }
  Widget buildInkWellContainer1(BuildContext context){
    return Material(
        child: Ink(
            child: InkWell(
              child: Container(
                height: 600,
                alignment: const Alignment(0,0),
                child: Ink.image(
                    image: AssetImage(imageList[i])
                ),
              ),
              onTap: (){
                showSnackbar(context);
              },
            )
        )
    );
  }


  void showSnackbar(BuildContext context){
    final snackBar = SnackBar(
      content: const Text('Hi, I am SnackBar'),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      action: SnackBarAction(
        label: "Toast訊息",
        textColor: Colors.white,
        onPressed: ()=> Fluttertoast.showToast(
            msg: '你按下SnackBar',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 20
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}