import 'package:flutter/material.dart';

class FileAndConnectEntranceRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作与网络请求"),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("文件操作"),
                    onPressed: () {
                      Navigator.pushNamed(context, "fileOperation");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("httpClient发送http请求"),
                    onPressed: () {
                      Navigator.pushNamed(context, "httpClient");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("Dio http 库"),
                    onPressed: () {
                      Navigator.pushNamed(context, "dio_httpRequest");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("分块下载"),
                    onPressed: () {
                      Navigator.pushNamed(context, "downloadWithChunks");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("Websocket"),
                    onPressed: () {
                      Navigator.pushNamed(context, "webSocket");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
