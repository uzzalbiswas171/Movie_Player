import 'package:assinment_of_spondonit/Custom_Widget/custom_movie_card.dart';
import 'package:assinment_of_spondonit/Provider/CustomProvider/custom_provider.dart';
import 'package:assinment_of_spondonit/Screen/MovieDetailsScreen/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarItemHomeScreen extends StatefulWidget {
  const BottomNavigationBarItemHomeScreen({Key? key}) : super(key: key);
  @override
  State<BottomNavigationBarItemHomeScreen> createState() =>
      _BottomNavigationBarItemHomeScreenState();
}

class _BottomNavigationBarItemHomeScreenState
    extends State<BottomNavigationBarItemHomeScreen> {
  @override
  void initState() {
    ///....Call provider .///
    Provider.of<CustomProvider>(context, listen: false).Get_Movie_list(context);
    // TODO: implement initState
    super.initState();
  }
  int lengt=0;

  @override
  Widget build(BuildContext context) {
    final Movie_list = Provider
        .of<CustomProvider>(context)
        .Movie_list;
    double valu=Movie_list.length/1000;

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
             // color: Colors.cyan.shade100,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 200),
                itemCount:lengt,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     Navigator.push(
                         context, MaterialPageRoute(
                       builder: (context) =>  MovieDetailsScreen(index: index)
                     ));
                    },
                    child: CustomMovieCard(
                      f1: 3,
                      f2: 1,
                      title: Movie_list[index].title,
                      image: Movie_list[index].thumbnailUrl,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.yellow.withOpacity(0.1),
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      if(lengt >= 5){
                        setState(() {
                          lengt=5;
                          print(lengt);
                        });
                      }else{
                        setState(() {
                          lengt=lengt-valu.toInt();
                          print(lengt);
                        });
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(9)),
                        height: 30,
                        width: 50,
                        child: Text("prev")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lengt=lengt+5;
                        print(lengt);
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(9)),
                        height: 30,
                        width: 50,
                        child: Text("next")),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
