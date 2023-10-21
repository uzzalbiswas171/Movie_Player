import 'package:assinment_of_spondonit/Provider/CustomProvider/custom_provider.dart';
import 'package:assinment_of_spondonit/Screen/MovieDetailsScreen/movie_details_screen.dart';
import 'package:assinment_of_spondonit/Screen/bootom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomProvider>(create: (_) => CustomProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       home:MyHomePage()
      ),
    );
  }
}


