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
import 'package:flutter_bloc_demo/bloc/cart_events.dart';
import 'package:flutter_bloc_demo/bloc/cart_state.dart';
import 'package:flutter_bloc_demo/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
  ProductsScreen Widget

  This file contains the implementation of the ProductsScreen widget,
  which extends StatefulWidget. The ProductsScreen displays a list of
  products and allows users to add or remove items from the cart using
  the BLoC pattern.

*/
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLoC Demo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          // Cart icon button to navigate to the cart screen
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (_, cart) {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, position) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Display product name
                      Expanded(child: Text(products[position])),
                      // Button to remove product from the cart
                      IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(RemoveProductEvent(products[position]));
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                      // Display current quantity of the product in the cart
                      Text(cart.getItemCount(products[position]).toString()),
                      // Button to add product to the cart
                      IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(AddProductEvent(products[position]));
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
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
