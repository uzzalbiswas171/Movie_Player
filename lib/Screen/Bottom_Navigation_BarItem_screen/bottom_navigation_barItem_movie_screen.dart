
import 'package:assinment_of_spondonit/Custom_Widget/custom_movie_card.dart';
import 'package:assinment_of_spondonit/Provider/CustomProvider/custom_provider.dart';
import 'package:assinment_of_spondonit/Screen/MovieDetailsScreen/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarItemMovieScreen extends StatefulWidget {
  BottomNavigationBarItemMovieScreen({Key? key,this.index,this.isdetails}) : super(key: key);
  bool? isdetails=true;
  int? index;
  @override
  State<BottomNavigationBarItemMovieScreen> createState() => _BottomNavigationBarItemMovieScreenState();
}

class _BottomNavigationBarItemMovieScreenState extends State<BottomNavigationBarItemMovieScreen> {
  @override
  Widget build(BuildContext context) {

    final Movie_list = Provider
        .of<CustomProvider>(context)
        .Movie_list;
    return SafeArea(child: Container(

      height: double.infinity,
      width: double.infinity,
      color: Colors.yellow.shade100,
      child: ListView.builder(
        itemCount: Movie_list.length,
        itemBuilder: (context, index) {
          return Container(
            height: 400,
            margin: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10
            ),
            child: CustomMovieCard(
                f1: 8,
                f2: 1,
                image: Movie_list[index].url,
                title: Movie_list[index].title),
          );
        },),
    ));
  }
}
