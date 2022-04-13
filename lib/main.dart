import 'package:dashbord_ui/constant/colors.dart';
import 'package:dashbord_ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor),
      home: MainScreen(),
    );
    //   MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(
    //         create: (context) => MenuController(),
    //       ),
    //     ],
    //     child: const MainScreen(),
    //   ),
    // );
  } 
}