import 'package:flutter/material.dart';

import '../../../checkout/presentation/screens/check_out_screen.dart';



class AddToCartListProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addItem( item) {
    _items.add(item);
    notifyListeners();
  }
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void addItem2( product, int quantity) {
     clearCart();
      _items.add(product..quantity = quantity);
    notifyListeners();
  }


  void removeItem( item) {
    _items.remove(item);
    notifyListeners();
  }

  bool isAddedToCart(product) {
    return _items.contains(product);
  }
  void updateQuantity( product, int newQuantity) {
    final index = _items.indexWhere((item) => item.name == product.name);
    if (index != _items.length-1) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  double calculateTotalAmount(product, int quantity) {
    return product.price * quantity;
  }


  double getTotalAmount() {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
