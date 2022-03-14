import 'package:flutter/material.dart';
import 'package:shodai_mama_pro/models/item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final Item item;
  const DetailsPage({Key? key, required this.item}) : super(key: key);
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.author),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              _launchURL(item.url);
            },
            child: Text(item.url)),
      ),
    );
  }
}
