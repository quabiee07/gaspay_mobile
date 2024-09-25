import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/checkout_transaction_pin_screen.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/portions/details_portion.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/portions/payment_portion.dart';
import 'package:provider/provider.dart';
import '../../../../core/presentation/manager/comment_provider.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../../../add to cart/presentation/manager/add_to_cart_list_provider.dart';
import '../widgets/check_out_indicator_progress_row.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({
    super.key,
  });

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  AddToCartListProvider addToCartListProvider = AddToCartListProvider();

  @override
  Widget build(BuildContext context) {
    final addToCartListProvider = Provider.of<AddToCartListProvider>(context);
    final theme = Theme.of(context);
    final List<Widget> screens = getScreens();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: ReusableBackButtonWithTitle(
                isBackIconVisible: true,
                isText: true,
                title: "CheckOut",
                suffixWidget: const Icon(Icons.close),
                onTap: () {
                  setState(() {
                    if (currentPage == 1) {
                      pageController.previousPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CheckOutIndicatorProgressRow(
              currentPage: currentPage,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = pageController.page?.round() ?? 0;
                  });
                },
                children: screens,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 40,
                top: 28,
              ),
              decoration:
                  BoxDecoration(color: theme.colorScheme.surface, boxShadow: [
                BoxShadow(
                  color: colorBlack.withOpacity(0.25),
                  blurRadius: 18,
                  offset: const Offset(0, 2),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Order Total(${addToCartListProvider.items.length})",
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 16,
                              color: mediumGray2,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: blueTabBarContainerColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "NGN ${addToCartListProvider.getTotalAmount().toStringAsFixed(1)}",
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: 18,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    label: "Proceed",
                    onTap: () {
                      nextPage();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  late PageController pageController;
  int currentPage = 0;

  late TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    final commentsProvider =
        Provider.of<CommentsProvider>(context, listen: false);
    if (commentsProvider.commentAddToCart1.isNotEmpty) {
      commentController =
          TextEditingController(text: commentsProvider.commentAddToCart1);
    } else {
      commentController =
          TextEditingController(text: commentsProvider.commentAddToCart2);
    }
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void nextPage() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    if (currentPage == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CheckoutTransactionPinScreen(),
        ),
      );
    }
  }

  List<Widget> getScreens() {
    return [
      DetailsPortion(
        nextPage: nextPage,
      ),
      PaymentPortion(
        nextPage: nextPage,
      ),
    ];
  }
}

class Product {
  Product({
    required this.id,
    this.image,
    required this.name,
    required this.price,
    required this.category,
    this.addedToCart = false,
    this.quantity = 0,
  });

  final int id;
  final String? image;
  final String name;
  final double price;
  final String category;
  bool addedToCart;
  int quantity;

  static List<Product> allProducts = [
    Product(
      id: 1,
      image: "assets/images/buyGas2.png",
      name: "Petrol",
      price: 100,
      category: 'Fuel',
    ),
    Product(
      id: 2,
      image: "assets/images/buyGas2.png",
      name: "Diesel",
      price: 120,
      category: 'Fuel',
    ),
    Product(
      id: 3,
      image: "assets/images/buyGas2.png",
      name: "Synthetic Oil",
      price: 200,
      category: 'Engine Oil',
    ),
    Product(
      id: 4,
      image: "assets/images/buyGas2.png",
      name: "Mineral Oil",
      price: 150,
      category: 'Engine Oil',
    ),Product(
      id: 5,
      name: "PMS",
      price: 800,
      category: 'Petroleum Product',
    ),Product(
      id: 6,
      name: "Diesel",
      price: 1200,
      category: 'Petroleum Product',
    ),Product(
      id: 7,
      name: "Kerosene",
      price: 500,
      category: 'Petroleum Product',
    ),Product(
      id: 8,
      name: "Cooking",
      price: 1200,
      category: 'Petroleum Product',
    ),
  ];
}
