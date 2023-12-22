import 'package:contactbook/homepage.dart';
import 'package:contactbook/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((_) => 
  runApp(DevicePreview(
    enabled:false,
    builder: (context) =>const MyApp())),
    );
    
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
   debugShowCheckedModeBanner: false,
    initialRoute: '/', home: HomePage(),
    routes: {
  '/second': (context)=> const Secondpage(),
},

   );
  }
}

