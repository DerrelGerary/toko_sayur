import 'dart:ui';

import 'grocery_product_review_screen.dart';
import '../utils/widget_generator.dart';
import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../utils/spacing.dart';
import '../utils/text_utils.dart';
import '../widgets/button/button.dart';
import '../widgets/container/container.dart';
import '../widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_theme.dart';
import 'grocery_checkout_screen.dart';
import '../models/product.dart';

class GrocerySingleProductScreen extends StatefulWidget {
  final String heroKey;
  final Product product;

  // ignore: use_key_in_widget_constructors
  const GrocerySingleProductScreen(this.product, this.heroKey);

  @override
  _GrocerySingleProductScreenState createState() =>
      _GrocerySingleProductScreenState();
}

class _GrocerySingleProductScreenState extends State<GrocerySingleProductScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    products = Product.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.customTheme.groceryPrimary.withAlpha(68),
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: AppTheme.customTheme.groceryPrimary,
                size: 20,
              ),
            ),
            actions: [
              Icon(
                MdiIcons.heartOutline,
                color: AppTheme.customTheme.groceryPrimary,
                size: 20,
              ),
              FxSpacing.width(16)
            ],
          ),
          backgroundColor: Colors.white,
          body: Container(
            color: AppTheme.customTheme.groceryPrimary.withAlpha(68),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: widget.heroKey,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                FxSpacing.height(24),
                FxContainer(
                  padding: Spacing.all(24),
                  color: AppTheme.customTheme.bgLayer1,
                  borderRadiusAll: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FxText.sh1(widget.product.name,
                                    fontWeight: 700),
                                FxSpacing.height(8),
                                Row(
                                  children: [
                                    const FxText.caption(
                                      "Rp 3.99",
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                    FxSpacing.width(8),
                                    // Space.width(8),
                                    const FxText.b2(
                                      "Rp 2.32",
                                      fontWeight: 600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          FxContainer(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GroceryProductReviewScreen()));
                            },
                            padding: Spacing.fromLTRB(8, 6, 8, 6),
                            color: AppTheme.customTheme.groceryPrimary
                                .withAlpha(40),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FxText.b2("(243 ulasan)",
                                    color: AppTheme.customTheme.groceryPrimary,
                                    fontWeight: 500,
                                    letterSpacing: -0.2),
                                Icon(
                                  MdiIcons.chevronRight,
                                  size: 14,
                                  color: AppTheme.customTheme.groceryPrimary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      FxSpacing.height(4),
                      FxText.caption(widget.product.description,
                          letterSpacing: 0.4, fontWeight: 500, muted: true),
                      FxSpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FxContainer(
                                borderRadiusAll: 4,
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                padding: Spacing.all(6),
                                color: AppTheme.customTheme.groceryPrimary
                                    .withAlpha(48),
                                child: Icon(
                                  MdiIcons.minus,
                                  size: 14,
                                  color: AppTheme.customTheme.groceryPrimary,
                                ),
                              ),
                              FxSpacing.width(12),
                              FxText.b1(quantity.toString(), fontWeight: 600),
                              FxSpacing.width(12),
                              FxContainer(
                                borderRadiusAll: 4,
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                padding: Spacing.all(6),
                                color: AppTheme.customTheme.groceryPrimary,
                                child: Icon(
                                  MdiIcons.plus,
                                  size: 14,
                                  color: AppTheme.customTheme.groceryOnPrimary,
                                ),
                              ),
                            ],
                          ),
                          FxSpacing.width(24),
                          Expanded(
                              child: FxButton(
                            borderRadiusAll: 4,
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GroceryCheckoutScreen()));
                            },
                            child: FxText.b2("Beli Sekarang",
                                fontWeight: 600,
                                color: AppTheme.customTheme.groceryOnPrimary),
                            backgroundColor:
                                AppTheme.customTheme.groceryPrimary,
                          ))
                        ],
                      ),
                      FxSpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          FxText.sh1("Terkait", fontWeight: 600),
                          FxText.caption("Lihat Semua",
                              fontWeight: 600, xMuted: true, letterSpacing: 0),
                        ],
                      ),
                      FxSpacing.height(16),
                      Column(
                        children: buildProducts(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<Widget> buildProducts() {
    List<Widget> list = [];
    for (Product product in products) {
      list.add(getSingleProduct(product));
    }
    return list;
  }

  Widget getSingleProduct(Product product) {
    String heroKey = Generator.getRandomString(10);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) =>
                    GrocerySingleProductScreen(product, heroKey)));
      },
      child: FxContainer(
        margin: Spacing.bottom(16),
        color: AppTheme.customTheme.groceryBg2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxContainer(
              color: AppTheme.customTheme.groceryPrimary.withAlpha(32),
              padding: Spacing.all(8),
              child: Hero(
                tag: heroKey,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    product.image,
                    width: 72,
                    height: 72,
                  ),
                ),
              ),
            ),
            FxSpacing.width(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.b2(product.name,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600),
                  FxSpacing.height(8),
                  FxText.overline(product.description,
                      color: AppTheme.theme.colorScheme.onBackground,
                      muted: true),
                  FxSpacing.height(8),
                  product.discountedPrice != product.price
                      ? Row(
                          children: [
                            FxText.caption(
                                "Rp " +
                                    FxTextUtils.doubleToString(product.price),
                                decoration: TextDecoration.lineThrough,
                                fontWeight: 500),
                            // Space.width(8),
                            FxSpacing.width(8),
                            FxText.b2(
                                "Rp " +
                                    FxTextUtils.doubleToString(
                                        product.discountedPrice),
                                color: AppTheme.theme.colorScheme.onBackground,
                                fontWeight: 700),
                          ],
                        )
                      : FxText.b2(
                          "Rp " + FxTextUtils.doubleToString(product.price),
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 700),
                ],
              ),
            ),
            // Space.width(8),
            Icon(
              MdiIcons.heartOutline,
              color: AppTheme.customTheme.groceryPrimary,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}