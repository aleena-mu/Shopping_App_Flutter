import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/pages/home_page.dart';


void main() {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber,
          primary: Colors.amber[300]),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              centerTitle: true,
              titleTextStyle:
                TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:Colors.black
              ),
      
            ),
            inputDecorationTheme: const InputDecorationTheme(
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1  ),
              hintStyle:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
      
              ),
              textTheme: const TextTheme(
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                titleSmall: TextStyle(
                  fontSize: 15,
                ),
                titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize:35,
                ),
              ),
          useMaterial3: true,
        ),
      
      
        home: const Homepage()
      ),
    );
  }
}
