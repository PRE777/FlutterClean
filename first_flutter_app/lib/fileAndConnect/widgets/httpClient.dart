// HttpClient

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class HttpClientTextRoute extends StatefulWidget {
  @override
  _HttpClientTextRouteState createState() => new _HttpClientTextRouteState();
}

class _HttpClientTextRouteState extends State<HttpClientTextRoute> {
  bool _isLoading = false;
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpClient发起HTTP请求"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("发送Get请求"),
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                        _text = "正在加载请稍后……";
                      });
                      String baseUrl = "qa.iwhere.com:8010";
                      var unencodedPath = "/sea-ranch/base/getDataCatagoryInfo";
                      try {
                        var data =
                            await sendHttpRequest(baseUrl, unencodedPath);
                        _text = data.toString();
                        setState(() {});
                      } catch (e) {
                        _text = "请求失败：$e";
                      } finally {
                        _isLoading = false;
                      }
                    },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("发送Post请求"),
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                        _text = "正在加载请稍后……";
                      });
                      String baseUrl = "qa.iwhere.com:8010";
                      Map header = {
                        "user-agent":
                            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36",
                        "Connection": "Keep-Alive",
                        "loginSource": "IOS",
                      };
                      var parameters = {
                        "geoLevel": "16",
                        "lbLng": "108.4911696442929",
                        "lbLat": "21.458870152755804",
                        "rtLng": "108.94032728635263",
                        "rtLat": "21.83553861458526",
                      };
                      var unencodedPath = "/sea-ranch/visual/drawGridOnMap";
                      try {
                        var data = await sendHttpRequest(baseUrl, unencodedPath,
                            httpHeader: header,
                            method: "Post",
                            parameters: parameters);
                        _text = data.toString();
                        setState(() {});
                      } catch (e) {
                        _text = "请求失败：$e";
                      } finally {
                        _isLoading = false;
                      }
                    },
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tight(Size(
                  MediaQuery.of(context).size.width - 50,
                  MediaQuery.of(context).size.height - 200)),
              child: SingleChildScrollView(
                child: Container(
                  // width: MediaQuery.of(context).size.width - 50,
                  color: Colors.grey[200],
                  child: Text(_text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> sendHttpRequest(
    String baseUrl, String unencodedPath,
    {Map httpHeader,
    String method = "get",
    Map<String, dynamic> parameters}) async {
  HttpClient httpClient = new HttpClient();
  httpClient.connectionTimeout = Duration(seconds: 20); // 超时时间
  HttpClientRequest request;
  Uri uri;

  if (bool.fromEnvironment("dart.vm.product") == false) {
    // Debug 模式下（非生产模式），抓包时将true改为false
    // charles 抓包需要，10.3.11.49 为本机IP
    httpClient.findProxy = (url) {
      return HttpClient.findProxyFromEnvironment(url, environment: {
        "http_proxy": "http://10.3.11.49:8888",
      });
    };
  }
  if (method.toUpperCase() == "POST") {
    // 此处baseUrl 不可以带http://
    uri = Uri.http(baseUrl, unencodedPath, parameters);
    request = await httpClient.postUrl(uri);
  } else if (method.toUpperCase() == "GET") {
    // 此处baseUrl 不可以带http://
    uri = new Uri.http(baseUrl, unencodedPath, parameters);
    request = await httpClient.getUrl(uri);
  }
  // 设置请求头
  if (httpHeader != null) {
    httpHeader.forEach((key, value) {
      request.headers.add(key, value);
    });
  }
  // 接收请求响应
  HttpClientResponse response = await request.close();
  //读取响应内容
  var _text = await response.transform(utf8.decoder).join();
  httpClient.close();
  print(jsonDecode(_text));
  return jsonDecode(_text);
}
