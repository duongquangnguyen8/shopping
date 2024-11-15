import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart_provider.dart';
import 'package:shop/provider/favorite._provider.dart';
import 'package:shop/screens/nav_bar_screens.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(textTheme: GoogleFonts.mulishTextTheme()),
            home: BottomNavBar(),
          ));
}
