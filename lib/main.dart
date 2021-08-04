import 'package:flutter/material.dart';
import 'package:mini_project/config/stringresource.dart';
import 'package:mini_project/features/dashboard/presentation/pages/lib_page_datadiri.dart';
import 'package:mini_project/theme/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringResources.TEXT_APLICATION_TITLE,
      theme: ThemeData(
        primarySwatch: ColorPalette.red,
      ),
      debugShowCheckedModeBanner: false,
      home: PageDataDiri(),
    );
  }
}
