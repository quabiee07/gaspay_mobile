import 'package:flutter/material.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/manager/add_to_cart_list_provider.dart';
import 'package:provider/provider.dart';
import '../../../../checkout/presentation/screens/check_out_screen.dart';
import '../../widgets/reusable_engine_oil_container.dart';

class EngineOilPortion extends StatefulWidget {
  const EngineOilPortion({
    super.key,
    required this.commentController
  });
  final TextEditingController commentController;

  @override
  State<EngineOilPortion> createState() => _EngineOilPortionState();
}

class _EngineOilPortionState extends State<EngineOilPortion> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addToCartListProvider = Provider.of<AddToCartListProvider>(context);
    List<Product> engineOilProducts = Product.allProducts
        .where((product) => product.category == 'Engine Oil')
        .toList();
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: engineOilProducts.length,
                itemBuilder: (context, index) {
                  final product = engineOilProducts[index];
                  final isInCart = addToCartListProvider.isAddedToCart(product);
                  return ReusableEngineOilContainer(
                    product: engineOilProducts[index],
                    addToCart: () {
                      if (!isInCart) {
                        addToCartListProvider.addItem(product);
                        product.addedToCart = true;
                        product.quantity = 1;
                        addToCartListProvider.getTotalAmount();
                      }
                    },
                    addQuantity: () {
                      if (isInCart) {
                        product.quantity++;
                        addToCartListProvider.getTotalAmount();
                        addToCartListProvider.notifyListeners();
                      }
                    },
                    removeQuantity: () {
                      if (isInCart && product.quantity > 1) {
                        product.quantity--;
                        addToCartListProvider.getTotalAmount();
                        addToCartListProvider.notifyListeners();
                      } else if (isInCart && product.quantity == 1) {
                        product.addedToCart = false;
                        widget.commentController.clear();
                        addToCartListProvider.removeItem(product);
                        addToCartListProvider.getTotalAmount();
                      }
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
