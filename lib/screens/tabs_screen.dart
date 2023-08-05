import "package:flutter/material.dart";
import "home_screen.dart";
import "./profile_screen.dart";
import "../widgets/app_drawer.dart";

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(CoinScreen.routeName);
            },
            icon: Icon(Icons.portable_wifi_off_outlined),
          ),
        ],
        title: const Text("Food classification"),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.camera,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.blue,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            HomeScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.black : Colors.white,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color:
                                currentTab == 0 ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfileScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 1 ? Colors.black : Colors.white,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color:
                                currentTab == 1 ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }
}
