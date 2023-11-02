import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:food_classification_app/providers/trecks_provider.dart";
import "package:food_classification_app/screens/profile_screen.dart";
import "package:provider/provider.dart";
import "./screens/tabs_screen.dart";
import "./screens/onboarding_screen.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:food_classification_app/providers/google_sign_in.dart';
import "package:cloud_firestore/cloud_firestore.dart";

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GoogleSignInProvider>(create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider(
          create: (_) => TrecksProvider(),
        ),
      ],
      child: MaterialApp(
        title: "FoodSnap",
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(222, 230, 232, 1),
          splashColor: const Color.fromRGBO(50, 75, 80, 1),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(222, 230, 232, 1),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Color.fromRGBO(50, 75, 80, 1),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromRGBO(222, 230, 232, 1),
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),
          textTheme: const TextTheme(),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(50, 75, 80, 1),
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final db = FirebaseFirestore.instance;
              final user = FirebaseAuth.instance.currentUser!;
              db.collection("users").doc(user.email).set({
                "email": user.email,
                "name": user.displayName,
                "photoUrl": user.photoURL
              });
              Provider.of<TrecksProvider>(context).fetchAndSetTreck(user);

              return TabsScreen();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong!"),
              );
            } else {
              return const OnboardingScreen();
            }
          },
        ),
        routes: {
          TabsScreen.routeName: (_) => TabsScreen(),
          ProfileScreen.routeName: (_) => ProfileScreen(),
        },
      ),
    );
  }
}
