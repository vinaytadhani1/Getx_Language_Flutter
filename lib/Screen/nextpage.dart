import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nextpage extends StatefulWidget {
  Nextpage({Key? key}) : super(key: key);

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('addressbook'.tr),
      ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}