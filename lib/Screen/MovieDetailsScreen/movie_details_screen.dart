import 'package:assinment_of_spondonit/Provider/CustomProvider/custom_provider.dart';
import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bootom_navigation_baritem_profile_screen.dart';
import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bottom_navigation_barItem_movie_screen.dart';
import 'package:assinment_of_spondonit/Screen/bootom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsScreen({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    BottomNavigationBarItemMovieScreen(),
    Peofile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

// Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));

  }
  @override
  void initState() {
    Provider.of<CustomProvider>(context, listen: false).Get_Movie_list(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Movie_list = Provider.of<CustomProvider>(context).Movie_list;
    return Scaffold(
      appBar:AppBar(
          centerTitle: true,
          title: const Text('Movie'),
          backgroundColor: Colors.blue
      ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(left: 10,right: 10,top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 8,
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                        image: DecorationImage(
                            image: NetworkImage("${Movie_list[widget.index].url}"),
                            fit: BoxFit.fill)),
                  )),
              SizedBox(height: 5,),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "title: ${Movie_list[widget.index].title}",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                        Text("id: ${Movie_list[widget.index].id}",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        Text("albumId: ${Movie_list[widget.index].albumId}",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                      ],
                    ),
                  )),
              Container(
                height: 50,
                width: double.infinity,
             //   color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade200,
                              border: Border.all(width: 1,color: Colors.black45)
                            ),
                            child: Icon(Icons.back_hand_sharp)),
                        SizedBox(width: 5,),
                        Text("Like"),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade200,
                              border: Border.all(width: 1,color: Colors.black45)
                            ),
                            child: Icon(Icons.heart_broken_outlined)),
                        SizedBox(width: 5,),
                        Text("Love"),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade200,
                              border: Border.all(width: 1,color: Colors.black45)
                            ),
                            child: Icon(Icons.share)),
                        SizedBox(width: 5,),
                        Text("Share"),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
    );
  }
}
