import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {
 WebViewController _controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
          initialUrl: 'about:blank',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets(getHtml());
          }),
    );
  }

  _loadHtmlFromAssets(String htmlText) async {
    _controller.loadUrl(Uri.dataFromString(htmlText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  String getHtml() {
    StringBuffer htmlSb = new StringBuffer();
    htmlSb.write("<html>");
    htmlSb.write("<head>");
    htmlSb
        .write("<link type=\"text/css\" rel=\"stylesheet\" href=\"note.css\">");

    htmlSb.write("</head>");
    htmlSb.write("<body>");
    htmlSb.write("<h1>This is a heading</h1>");

    htmlSb.write("<p>This is a paragraph.</p>");
    htmlSb.write("</body>");

    htmlSb.write("</html>");
    return htmlSb.toString();
  }
}
