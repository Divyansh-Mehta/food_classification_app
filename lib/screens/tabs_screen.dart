import "package:flutter/material.dart";
import "package:food_classification_app/providers/trecks_provider.dart";
import "home_screen.dart";
import "../widgets/app_drawer.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

class TabsScreen extends StatefulWidget {
  static const routeName = "/TabsScreen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  void initState() {
    // _trecksFuture = _obtainTrecksFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TrecksProvider>(context);
    void erase() {
      provider.cleanTreck();
    }

    return Scaffold(
      endDrawer: AppDrawer(erase),
      appBar: AppBar(
        title: Text(
          "FoodSnap",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(50, 75, 80, 1),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.camera_alt_outlined,
      //     size: 30,
      //     color: Color.fromRGBO(50, 75, 80, 1),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //shape of notch
        // notchMargin:
        //     5, //notche margin between floating button and bottom appbar
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
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
                        color: currentTab == 0
                            ? const Color.fromRGBO(50, 75, 80, 1)
                            : const Color.fromRGBO(152, 152, 156, 1),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: currentTab == 0
                              ? const Color.fromRGBO(50, 75, 80, 1)
                              : const Color.fromRGBO(152, 152, 156, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right Tab bar icons
              // Expanded(
              //   child: MaterialButton(
              //     splashColor: Colors.transparent,
              //     highlightColor: Colors.transparent,
              //     hoverColor: Colors.transparent,
              //     minWidth: 40,
              //     onPressed: () {
              //       setState(() {
              //         currentScreen =
              //             TrackScreen(); // if user taps on this dashboard tab will be active
              //         currentTab = 1;
              //       });
              //     },
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         Icon(
              //           Icons.track_changes,
              //           color: currentTab == 1
              //               ? const Color.fromRGBO(50, 75, 80, 1)
              //               : const Color.fromRGBO(152, 152, 156, 1),
              //         ),
              //         Text(
              //           'Track',
              //           style: TextStyle(
              //             color: currentTab == 1
              //                 ? const Color.fromRGBO(50, 75, 80, 1)
              //                 : const Color.fromRGBO(152, 152, 156, 1),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      // FutureBuilder(
      //   future: _trecksFuture,
      //   builder: (ctx, dataSnapshot) {
      //     if (dataSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else {
      //       if (dataSnapshot.error != null) {
      //         return Center(child: const Text("An error occurred!"));
      //       } else {
      //         return HomeScreen();
      //       }
      //     }
      //   },
      // ),
    );
  }
}
