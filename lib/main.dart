/*
 *
 *  ***********************************************************************************************
 *  * FLUTTER_BLOC_DEMO® Copyright FLUTTER_BLOC_DEMO. 2024. All rights reserved.
 *  *
 *  * The Skin care application for Doctors and staffs to manage patient appointments and medicine history
 *  *
 *  * This source code is protected by international copyright law. Unauthorized
 *  * reproduction, reverse-engineering, or distribution of any portion of
 *  * this source code is strictly prohibited.
 *  *
 *  * Developed by Zignuts Technolab Pvt. Ltd.
 *  *
 *  * This source code contains confidential and proprietary trade secrets of
 *  * FLUTTER_BLOC_DEMO®, and should at no time be copied, transferred, sold,
 *  * distributed or made available without express written permission.
 *  * **********************************************************************************************
 *
 */
import 'package:flutter_bloc_demo/bloc/cart_bloc.dart';
import 'package:flutter_bloc_demo/screens/cart_screen.dart';
import 'package:flutter_bloc_demo/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
  Main Entry Point and MyApp Class

  This file contains the main entry point for the Flutter application
  and the implementation of the MyApp class, which sets up the application's
  theme, routing, and state management using the BLoC pattern.
*/

// Entry point of the application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Providing the CartBloc to the widget tree
      create: (_) => CartBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // Defining the routes for the application
        routes: {
          '/': (context) => const ProductsScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    );
  }
}
