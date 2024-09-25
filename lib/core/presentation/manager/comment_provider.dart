import 'package:flutter/material.dart';

class CommentsProvider with ChangeNotifier {
  String _commentAddToCart1 = '';
  String _commentAddToCart2 = '';
  String _checkoutComment = '';

  String get commentAddToCart1 => _commentAddToCart1;
  String get commentAddToCart2 => _commentAddToCart2;
  String get checkoutComment => _checkoutComment;

  void updateCheckoutComment(String comment) {
    _checkoutComment = comment;
    notifyListeners();
  }
  void updateCommentFromCart1(String comment) {
    _commentAddToCart1= comment;
    notifyListeners();
  }
   updateCommentFromCart2(String comment) {
    _commentAddToCart2= comment;
    notifyListeners();
  }
  void setCheckoutCommentFromCart(int cartNumber) {
    if (cartNumber == 1) {
      _checkoutComment = _commentAddToCart1;
    } else if (cartNumber == 2) {
      _checkoutComment = _commentAddToCart2;
    }
    notifyListeners();
  }
  void resetComments() {
    _commentAddToCart1 = '';
    _commentAddToCart2 = '';
    _checkoutComment = '';
    notifyListeners();
  }


}
