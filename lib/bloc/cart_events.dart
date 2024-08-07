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
  CartEvents Abstract Class

  This file contains the definition of the CartEvents abstract class and its
  concrete implementations. These events are used to manage the actions related
  to the cart in the BLoC pattern.
*/

// Abstract class for cart-related events
abstract class CartEvents {}

class AddProductEvent extends CartEvents {
  final String name;

  // Constructor for AddProductEvent
  AddProductEvent(this.name) : super();
}

class RemoveProductEvent extends CartEvents {
  final String name;

  // Constructor for RemoveProductEvent
  RemoveProductEvent(this.name) : super();
}
