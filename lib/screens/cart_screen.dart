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
import 'package:flutter_bloc_demo/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
  CartScreen Widget

  This file contains the implementation of the CartScreen widget,
  which extends StatefulWidget. The CartScreen displays a list of
  items in the cart using the BLoC pattern.
*/
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLoC Demo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (_, cart) {
            return ListView.builder(
              itemCount: cart.cart.length,
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          cart.cart.entries.toList()[position].key,
                        ),
                      ),
                      Text(
                        cart.cart.entries.toList()[position].value.toString(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
