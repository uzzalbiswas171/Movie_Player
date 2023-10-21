// import 'dart:async';
// import 'dart:io';
//
// import 'package:assinment_of_spondonit/Provider/CustomProvider/custom_provider.dart';
// import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bootom_navigation_baritem_profile_screen.dart';
// import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bottom_navigation_barItem_home_screen.dart';
// import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bottom_navigation_barItem_movie_screen.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'dart:developer' as developer;
//
// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final GlobalKey<ScaffoldState> _key = GlobalKey();
//   int _selectedIndex = 0;
//   final List<Widget> _widgetOptions = <Widget>[
//     BottomNavigationBarItemHomeScreen(),
//     BottomNavigationBarItemMovieScreen(),
//     Peofile(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// @override
//   void initState() {
//   checkConnection();
//   Provider.of<CustomProvider>(context, listen: false).Get_Movie_list(context);
//   // TODO: implement initState
//
//   super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       ///......Drawer from profile page.......///
//       drawer:Drawer(
//         child: Peofile(),
//       ) ,
//       appBar:AppBar(
//         centerTitle: true,
//           title: const Text('Movie'),
//           leading: IconButton(onPressed: () {
//             _key.currentState!.openDrawer();
//           }, icon: Icon(Icons.menu)),
//           backgroundColor: Colors.blue
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               backgroundColor:Colors.blue,
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.movie_creation_outlined),
//                 label:'Movie' ,
//               backgroundColor:Colors.blue,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label :'Profile' ,
//               backgroundColor:Colors.blue,
//             ),
//           ],
//           type: BottomNavigationBarType.shifting,
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.black,
//           iconSize: 40,
//           onTap: _onItemTapped,
//           elevation: 5
//       ),
//     );
//   }
//
// }




import 'dart:async';
import 'dart:developer' as developer;

import 'package:assinment_of_spondonit/Provider/CustomProvider/custom_provider.dart';
import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bootom_navigation_baritem_profile_screen.dart';
import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bottom_navigation_barItem_home_screen.dart';
import 'package:assinment_of_spondonit/Screen/Bottom_Navigation_BarItem_screen/bottom_navigation_barItem_movie_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    Provider.of<CustomProvider>(context, listen: false).Get_Movie_list(context);

  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }


    final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    BottomNavigationBarItemHomeScreen(),
    BottomNavigationBarItemMovieScreen(),
    Peofile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("dddddddddd${_connectionStatus.toString()}");
    return _connectionStatus.toString()=="ConnectivityResult.none"?Scaffold(body: Center(
      child: Container(
        height: 70,
        width: 70,
        child: Text("No internet")
      ),
    ),):Scaffold(
      key: _key,
      ///......Drawer from profile page.......///
      drawer:Drawer(
        child: Peofile(),
      ) ,
      appBar:AppBar(
        centerTitle: true,
          title: const Text('Movie'),
          leading: IconButton(onPressed: () {
            _key.currentState!.openDrawer();
          }, icon: Icon(Icons.menu)),
          backgroundColor: Colors.blue
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              backgroundColor:Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined),
                label:'Movie' ,
              backgroundColor:Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label :'Profile' ,
              backgroundColor:Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}