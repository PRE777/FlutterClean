//
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioHttpTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http请求-Dio http库"),
      ),
      body: Center(
        child: HttpResponseResult(),
      ),
    );
  }
}

class HttpResponseResult extends StatefulWidget {
  @override
  _HttpResponseResultState createState() => new _HttpResponseResultState();
}

class _HttpResponseResultState extends State<HttpResponseResult> {
  String _text = "";
  Dio _dio = new Dio();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text("发送请求"),
          onPressed: () {
            setState(() {});
          },
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: FutureBuilder(
              future:
                  _dio.get("https://api.github.com/orgs/flutterchina/repos"),
              builder: (BuildContext context, AsyncSnapshot snapShot) {
                Response response = snapShot.data;
                // 请求完成
                if (snapShot.connectionState == ConnectionState.done) {
                  if (snapShot.hasError) {
                    // 请求错误
                    return Text(snapShot.error.toString());
                  } else {
                    // 请求成功
                    return ListView(
                      children: response.data
                          .map<Widget>(
                              (e) => ListTile(title: Text(e["full_name"])))
                          .toList(),
                    );
                  }
                }
                //请求未完成时弹出loading
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ],
    );
  }
}
