import 'package:flutter/material.dart';

class CustomMovieCard extends StatelessWidget {
   CustomMovieCard({Key? key,required this.f1,required this.f2,required this.image,required this.title,}) : super(key: key);
   String ? title,image;
   int f1,f2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepOrange,
      ),
      child: Column(
        children: [
          Expanded(
            flex: f1,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(11),
                    topRight: Radius.circular(11),
                  ),
                  image: DecorationImage(image: NetworkImage("${image}"),fit: BoxFit.fill)
              ),
            ),
          ),
          Expanded(
            flex: f2,
            child: Container(
              height: 100,
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: Text("${title}"),
            ),
          ),
        ],
      ),
    );
  }
}
