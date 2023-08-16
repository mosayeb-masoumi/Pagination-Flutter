import 'package:flutter/material.dart';
import 'package:flutter_pagination_example/di/di.dart';
import 'package:flutter_pagination_example/static/pagination_static.dart';

import 'bloc_clean/presentation/bloc_pagination_example.dart';

void main() {
  setUpDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:const SimpleExamplePage(),
      // home:const BlocPaginationExample(),
      home:const PaginationStatic(),
    );
  }
}


