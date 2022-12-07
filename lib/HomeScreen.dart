import 'package:flutter/material.dart';
//import 'package:humanitarian_icons/humanitarian_icons.dart';
import 'AuthRepository.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,foreground: null);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: First Aid',
      style: optionStyle,
      selectionColor: Colors.white,
    ),
    Text(
      'Index 1: Messages',
      style: optionStyle,
      selectionColor: Colors.white,
    ),
    Text(
      'Index 2: Emg Call',
      style: optionStyle,
      selectionColor: Colors.white,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout()async{
    await Provider.of<AuthProvider>(context,listen:false).signOut();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully logged out")));
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Image.asset('assets/appBar2.png', fit:BoxFit.cover),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children:  const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF690B0A),
              ),
              child: Center(
                     child: Text(
                'Welcome ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle,color: Color(0xFF690B0A),),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Color(0xFF690B0A),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xFF690B0A),),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Color(0xFF690B0A),
                  fontSize: 24,
                ),),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Color(0xFF690B0A),),
              title: Text(
                'Check in',
                style: TextStyle(
                  color: Color(0xFF690B0A),
                  fontSize: 24,
                ),),
            ),
            ListTile(
              leading: Icon(Icons.handshake_rounded, color: Color(0xFF690B0A),),
              title: Text(
                'Help?',
                style: TextStyle(
                  color: Color(0xFF690B0A),
                  fontSize: 24,
                ),),
            ),
            ListTile(
              leading: Icon(Icons.question_mark_rounded, color: Color(0xFF690B0A),),
              title: Text(
                'About App',
                style: TextStyle(
                  color: Color(0xFF690B0A),
                  fontSize: 24,
                ),),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xFF690B0A),),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xFF690B0A),
                  fontSize: 24,
                ),),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red,),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ),),
              //onTap: _logout,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information_rounded,color: Colors.white,),//emergency_telecom
            label: 'First Aid',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,color: Colors.white,),
            label: 'Messages',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone,color: Colors.white,),
            label: 'Emg Call',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xFF690B0A),
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: Container(
        //clipBehavior:,
        //decoration: ShapeDecoration(shape: RoundedRectangleBorder(),color: Color(0xFF690B0A)),
        height: 180,
        color: Colors.white,
        child: PageView(
          controller: controller,
          children: <Widget>[
            Center(
              child: Image.asset('assets/pic1.png', height: 180,width:383,),
            ),
            Center(
              child: Text('Second Page'),
            ),
            Center(
              child: Text('Third Page'),
            ),
          ],
        ),
      ),
    );
  }
}

