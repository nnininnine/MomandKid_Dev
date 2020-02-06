import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:route_transitions/route_transitions.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  // static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'Dosis',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: Text(
      //     'MomAndKids.',
      //     style: TextStyle(
      //         color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 24,letterSpacing: 1.6),
      //   ),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //         icon: Icon(Icons.notifications_none),
      //         alignment: Alignment(2.0, 0.0),
      //         color: Colors.pink,
      //         iconSize: 25.0,
      //         onPressed: () {
      //           print('Notification');
      //           Navigator.push(
      //               context,
      //               PageRouteTransition(
      //                   animationType: AnimationType.slide_right,
      //                   builder: (context) => MyNotificationPage()));
      //         }),
      //     IconButton(
      //         icon: Icon(LineAwesomeIcons.cog),
      //         alignment: Alignment(0.0, -0.2),
      //         color: Colors.pink,
      //         iconSize: 25.0,
      //         onPressed: () {
      //           print('Setting');
      //         }),
      //   ],
      //   leading: IconButton(
      //     icon: Icon(
      //       LineAwesomeIcons.user,
      //       color: Colors.pink,
      //       size: 35.0,
      //     ),
      //     alignment: Alignment(0.0, -1.0),
      //     onPressed: () {
      //       print('Account');
      //     },
      //   ),
      // ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(top: 0.0),
                  //   child: Container(
                  //     height: 65.0,
                  //     child: ListView(
                  //       children:<Widget>[
                  //         IconButton(
                  //           icon: Icon(LineAwesomeIcons.user),
                  //           alignment: Alignment(-1.0, 0.0),
                  //           onPressed: (){}),
                          
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top:0.0),
                  //   child: Container(
                  //     height: MediaQuery.of(context).size.height-65.0,
                  //     child: ListView(
                  //       children:[
                          
                  //       ],
                  //     ),
                  //   ),
                    // )
                ],
              ),
            ),
            Container(color: Colors.red,),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: true,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          switch (index) {
            case 0:
              print('home');
              break;
            case 1:
              print('Article');
              break;
            case 2:
              print('Kid');
              break;
            case 3:
              print('Health');
              break;
            default:
          }
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(LineAwesomeIcons.home),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
              title: Text('Article'),
              icon: Icon(Icons.apps),
              activeColor: Colors.pink,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              title: Text('Kids'),
              icon: Icon(Icons.chat_bubble),
              activeColor: Colors.purple,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              title: Text('Health'),
              icon: Icon(Icons.settings),
              activeColor: Colors.blue,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              title: Text('Schedule'),
              icon: Icon(Icons.settings),
              activeColor: Colors.green,
              inactiveColor: Colors.black),
        ],
      ),
    );
  }
}

class MyNotificationPage extends StatefulWidget {
  MyNotificationPage({Key key}) : super(key: key);

  @override
  _MyNotificationPageState createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<MyNotificationPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Notification.',
          style: TextStyle(
            color: Colors.grey, 
            fontWeight: FontWeight.bold, 
            fontSize: 24,
            letterSpacing: 1.6
            ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
            size: 25.0,
          ),
          // alignment: Alignment(0.0,-1.0),
          onPressed: () {
            print('Back');
            Navigator.push(
                context,
                PageRouteTransition(
                    builder: (context) => MyHomePage(),
                    animationType: AnimationType.slide_left));
          },
        ),
      ),
    );
  }
}
