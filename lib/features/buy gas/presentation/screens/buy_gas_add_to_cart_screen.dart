import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:provider/provider.dart';
import '../../../../core/presentation/manager/comment_provider.dart';
import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/widgets/bottom_sheet_function.dart';
import '../../../../core/presentation/widgets/button.dart';
import '../../../../core/presentation/widgets/custom_comment_text_field_container.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../../../add to cart/presentation/manager/add_to_cart_list_provider.dart';
import '../../../add to cart/presentation/screens/featured_filling_station_see_more_screen.dart';
import '../../../add to cart/presentation/widgets/reusable_horizontal_divider.dart';
import '../../../checkout/presentation/screens/check_out_screen.dart';
import '../widgets/reusable_gas_purchase_container.dart';

class BuyGasAddToCartScreen extends StatefulWidget {
  const BuyGasAddToCartScreen({super.key});

  @override
  State<BuyGasAddToCartScreen> createState() => _BuyGasAddToCartScreenState();
}

class _BuyGasAddToCartScreenState extends State<BuyGasAddToCartScreen> {
  bool isSearching = false;
  late FocusNode _focusNode;
  late TextEditingController commentController2;
  Product? selectedProduct;
  String quantity = "0";
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    final commentProvider =
        Provider.of<CommentsProvider>(context, listen: false);
    commentController2 =
        TextEditingController(text: commentProvider.commentAddToCart2);
    _focusNode = FocusNode();
  }

 int getInt(String value){
    try{
     return int.parse(value);
    }
    catch(e){
    return  0;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    commentController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentsProvider>(context);
    final cartProvider = Provider.of<AddToCartListProvider>(context);
    List<Product> petroleumProduct = Product.allProducts
        .where((product) => product.category == 'Petroleum Product')
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableBackButtonWithTitle(
                  isBackIconVisible: true,
                  title: "Total Filling Station",
                  isText: true,
                  onTap: () {
                    cartProvider.clearCart();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Smith Roundabout",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF002933),
                      ),
                    ),
                    Row(
                      children: [
                        SvgImage(asset: thickStrokeHeartIcon),
                        SizedBox(
                          width: 16,
                        ),
                        SvgImage(asset: shareIcon),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Text(
                      "40-50 mins away",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4F5557),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const ReusableHorizontalDivider(),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "Opens 9am",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4F5557),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const ReusableHorizontalDivider(),
                    const SizedBox(
                      width: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/bigStarIcon.svg"),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text(
                          "3.9(33)",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4F5557),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FeaturedFillingStationSeeMoreScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "See more",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1875F7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFEDECEC),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFFFB1B1).withOpacity(
                      0.20,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [Image.asset(bigTotalLogo)],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                petroleumProduct.length,
                            itemBuilder: (context, index) {
                              final product =
                                  petroleumProduct[index];
                              return GestureDetector(
                                onTap: () {

                                  setState(() {
                                    selectedProduct = product;
                                    quantity = '1';
                                    totalAmount =
                                        cartProvider.calculateTotalAmount(
                                            product, getInt(quantity));
                                  });
                                  for (var p in petroleumProduct) {
                                    p.addedToCart = false;
                                  }
                                   product.addedToCart = true;

                                   cartProvider.addItem2(
                                       selectedProduct, getInt(quantity));

                                  cartProvider.notifyListeners();
                                  selectedProduct = product;
                                  // });
                                },
                                child: ReusableGasPurchaseContainer(
                                  product: product,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 120,
                        child: InputField2(
                            hint: '-',
                            inputType: TextInputType.number,
                            onChange: (val) {
                              setState(() {
                                if (val.isEmpty ||
                                    int.tryParse(val) == null ||
                                    int.parse(val) <= 0) {
                                  quantity = "1";
                                } else {
                                  quantity = val;
                                }
                                if (selectedProduct != null) {
                                  totalAmount =
                                      cartProvider.calculateTotalAmount(
                                          selectedProduct!,
                                          int.parse(quantity));
                                  cartProvider.addItem2(
                                      selectedProduct!, int.parse(quantity));
                                }
                              });
                            })),
                    const SizedBox(
                      width: 4,
                    ),
                    Consumer<AddToCartListProvider>(
                      builder: (context, provider, child) {
                        return Expanded(
                          child: InputField2(
                            readOnly: true,
                            hint: totalAmount.toStringAsFixed(1),
                            onChange: (val) {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Comment",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF002933),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomCommentTextFieldContainer(
                  commentController: commentController2,
                  onChange: (newComment) {
                    commentProvider.updateCommentFromCart2(newComment);
                  },
                  focusNode: _focusNode,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFEDECEC),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    sendGiftBottomSheet();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Send as Gift",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF002933),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: Color(
                            0xFF49495A,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFEDECEC),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Button(
                        title: 'Proceed',
                        onPressed: () {
                          if (selectedProduct != null) {
                            Provider.of<CommentsProvider>(context,
                                    listen: false)
                                .setCheckoutCommentFromCart(2);
                            cartProvider.addItem2(
                                selectedProduct!, int.parse(quantity));
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CheckOutScreen(),
                              ),
                            );
                          }
                        },
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendGiftBottomSheet() {
    BottomSheetFunction.showCustomBottomSheet(
      context: context,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            color: const Color(0xFFFAFAFE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sent as Gift",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF002933)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/confetti.png"),
                        Image.asset("assets/images/gift.png"),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.close,
                        color: Color(0xFF1875F7),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                InputField2(
                  hint: 'Purchasing For',
                  onChange: (val) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'From',
                  onChange: (val) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'Recipient Email address',
                  onChange: (val) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'Message (Optional)',
                  onChange: (val) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: InputField2(
                        hint: '+234',
                        onChange: (val) {},
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: InputField2(
                        hint: '-',
                        onChange: (val) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Button(
                      title: 'Confirm Details',
                      onPressed: () {},
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

