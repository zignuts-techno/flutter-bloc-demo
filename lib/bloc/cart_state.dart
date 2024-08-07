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

/*
  CartState Class

  This file contains the implementation of the CartState class,
  which manages the state of the cart in the application. It keeps
  track of the products in the cart and their quantities.

  Attributes:
    - Map<String, int> cart: A map that stores the products and their quantities.
*/
class CartState {
  late Map<String, int> cart;

  // Constructor to initialize an empty cart
  CartState.empty() {
    cart = {};
  }

  // Constructor to create a new CartState from an existing one
  CartState.from(CartState state) {
    cart = state.cart;
  }

  // Method to add a product to the cart or increment its quantity
  void addProduct(String product) {
    cart.update(product, (count) {
      return count + 1;
    }, ifAbsent: () {
      return 1;
    });
  }

  // Method to remove a product from the cart or decrement its quantity
  void removeProduct(String product) {
    cart.update(product, (count) {
      return count < 1 ? count : count - 1;
    }, ifAbsent: () {
      return 0;
    });
    // Remove the product from the cart if its quantity is 0
    if (cart[product] == 0) {
      cart.remove(product);
    }
  }

  // Method to get the quantity of a product in the cart
  int getItemCount(String product) {
    return cart[product] ?? 0;
  }
}
