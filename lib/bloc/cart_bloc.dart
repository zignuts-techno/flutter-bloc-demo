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
import 'package:flutter_bloc_demo/bloc/cart_events.dart';
import 'package:flutter_bloc_demo/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*
  CartBloc Class

  This file contains the implementation of the CartBloc class, which
  extends the Bloc class from the flutter_bloc package. The CartBloc
  class is responsible for managing the state of the cart by handling
  CartEvents and updating the CartState.
*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_events.dart';
import 'cart_state.dart';

/*
  CartBloc Class

  This file contains the implementation of the CartBloc class, which
  extends the Bloc class from the flutter_bloc package. The CartBloc
  class is responsible for managing the state of the cart by handling
  CartEvents and updating the CartState.
*/
class CartBloc extends Bloc<CartEvents, CartState> {
  // Constructor to initialize the cart with an empty state
  CartBloc() : super(CartState.empty()) {
    // Event handler for AddProductEvent
    on<AddProductEvent>((event, emit) {
      // Add the product to the cart
      state.addProduct(event.name);
      // Emit a new state based on the updated cart
      emit(CartState.from(state));
    });

    // Event handler for RemoveProductEvent
    on<RemoveProductEvent>((event, emit) {
      // Remove the product from the cart
      state.removeProduct(event.name);
      // Emit a new state based on the updated cart
      emit(CartState.from(state));
    });
  }
}
