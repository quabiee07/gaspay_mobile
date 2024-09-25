import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../checkout/presentation/screens/check_out_screen.dart';
import '../../manager/add_to_cart_list_provider.dart';
import '../../widgets/reusable_fuel_container.dart';

class FuelPortion extends StatefulWidget {
  const FuelPortion({super.key, required this.commentController});
  final TextEditingController commentController;

  @override
  State<FuelPortion> createState() => _FuelPortionState();
}

class _FuelPortionState extends State<FuelPortion> {
  @override
  Widget build(BuildContext context) {
    final addToCartListProvider = Provider.of<AddToCartListProvider>(context);
    List<Product> fuelProducts = Product.allProducts
        .where((product) => product.category == 'Fuel')
        .toList();
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fuelProducts.length,
              itemBuilder: (context, index) {
                final product = Product.allProducts[index];
                final isInCart = addToCartListProvider.isAddedToCart(product);
                return ReusableFuelContainer(
                  product: Product.allProducts[index],
                  addToCart: () {
                    if (!isInCart) {
                      addToCartListProvider.addItem(product);
                      product.addedToCart = true;
                      product.quantity = 1;
                    }
                  },
                  addQuantity: () {
                    if (isInCart) {
                      product.quantity++;
                      addToCartListProvider.notifyListeners();
                    }
                  },
                  removeQuantity: () {
                    if (isInCart && product.quantity > 1) {
                      product.quantity--;
                      addToCartListProvider.notifyListeners();
                    } else {
                      product.addedToCart = false;
                      widget.commentController.clear();
                      addToCartListProvider.removeItem(product);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
