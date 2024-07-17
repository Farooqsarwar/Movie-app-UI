import 'package:flutter/material.dart';
import 'package:movieapp/Screens/splash%20screen.dart';
import 'package:movieapp/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/watchlater controler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCAo5S6Qz9rx2p6JVosMYPZyhC3yCF2PW0',
      appId: '1:798524512607:android:01f61466273fe9769dfeea',
      messagingSenderId: '798524512607',
      projectId: 'movieapp-5d5e0',
      storageBucket: 'movieapp-5d5e0.appspot.com',)
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WatchLaterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splas_screen(),
      ),
    );
  }
}
