import 'package:flutter/material.dart';
import 'package:flutter_loading_dialog/dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 200),
        child: FlatButton(
            onPressed: () async {
              //ProgressDialog.showProgress(context);

              ProgressDialog.showProgress(context, child: SpinKitFadingCircle(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ));

              Future.delayed(Duration(seconds: 3)).then((_) {
                ProgressDialog.dismiss(context);
              });
            },
            child: Text("展示")),
      ),
    ));
  }
}
