import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:help/AuthRepository.dart';
import 'package:provider/provider.dart';
import 'package:help/LoginScreen.dart';
import 'package:help/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: Center(
                  child: Text(snapshot.error.toString(),
                      textDirection: TextDirection.ltr)));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider.instance(),
      child: Consumer<AuthProvider>(
        builder: (context, _login, _) =>
            MaterialApp(
              title: "Help",
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Color(0xFF690B0A),
                    foregroundColor: Colors.white,
                  )
              ),
               //home: Login(),
              initialRoute: '/login',
              routes: {
                '/home': (context) => HomeScreen(),
                '/login': (context) => Login(),
              },
            ),
      ),
    );
  }
}