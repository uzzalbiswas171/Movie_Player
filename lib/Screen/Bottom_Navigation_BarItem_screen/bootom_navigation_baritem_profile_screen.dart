import 'package:flutter/material.dart';

class Peofile extends StatelessWidget {
  const Peofile({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 90,
            width: double.infinity,
            color: Color(0xff162C49).withOpacity(0.85),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      //  color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    margin: EdgeInsets.only(
                      left: 14,
                      right: 15,
                    ),
                    child: CircleAvatar(
                      radius: 24,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ListTile(
                          title: Text(
                              "Uzzal Biswas",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            "01889173335",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'HOME',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.category,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'CATEGORIES',
                style: TextStylee().MyTextStyle
            ),

          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'SHOP',
                style: TextStylee().MyTextStyle
            ),
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_outlined,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'MY ACCOUNT',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),

          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'MY ADDRESS',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'MY FAVORITES',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.library_books,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'INTRO',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.radio,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'NEWS',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'LOG OUT',
                style: TextStylee().MyTextStyle
            ),
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
        ],
      ),
    );
  }
}
class TextStylee{
  TextStyle MyTextStyle=TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: Color(0xff162C49).withOpacity(0.85),
  ) ;
}
