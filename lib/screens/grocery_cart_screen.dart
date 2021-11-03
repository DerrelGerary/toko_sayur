import 'dart:developer';
import 'dart:ui';

import 'package:intl/intl.dart';

import '../utils/widget_generator.dart';
import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../themes/text_style.dart';
import '../utils/spacing.dart';
import '../utils/text_utils.dart';
import '../widgets/button/button.dart';
import '../widgets/container/container.dart';
import '../widgets/dashed_divider/dashed_divider.dart';
import '../widgets/text/text.dart';
import '../widgets/text_field/text_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_theme.dart';
import 'grocery_checkout_screen.dart';
import 'grocery_coupon_screen.dart';
import '../models/cart.dart';

class GroceryCartScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryCartScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryCartScreenState createState() => _GroceryCartScreenState();
}

class _GroceryCartScreenState extends State<GroceryCartScreen>
    with SingleTickerProviderStateMixin {
  late List<Cart> carts;
  double total = 0;
  double subTotal = 0;
  double shipping = 25000;
  double tax = 10;

  @override
  initState() {
    carts = Cart.getList();
    getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.customTheme.groceryBg1,
          title: const FxText.h6("Keranjang", fontWeight: 600),
        ),
        backgroundColor: AppTheme.customTheme.groceryBg1,
        body: ListView(
          padding: Spacing.fromLTRB(24, 8, 24, 70),
          children: <Widget>[
            Column(
              children: buildCarts(),
            ),
            FxSpacing.height(16),
            FxContainer(
              color: AppTheme.customTheme.groceryBg2,
              padding: Spacing.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: FxTextField(
                      hintText: "Kode Promo",
                      hintStyle: FxTextStyle.b2(),
                      labelStyle: FxTextStyle.b2(),
                      style: FxTextStyle.b2(),
                      labelText: "Kode Promo",
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: Spacing.right(16),
                      focusedBorderColor: Colors.transparent,
                      cursorColor: AppTheme.customTheme.groceryPrimary,
                      prefixIcon: Icon(
                        MdiIcons.ticketPercentOutline,
                        size: 22,
                        color: AppTheme.theme.colorScheme.onBackground
                            .withAlpha(150),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  FxButton.medium(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const GroceryCouponScreen()));
                    },
                    child: FxText.button("Temukan",
                        letterSpacing: 0.5,
                        fontWeight: 600,
                        color: AppTheme.customTheme.groceryOnPrimary),
                    backgroundColor: AppTheme.customTheme.groceryPrimary,
                    borderRadiusAll: 4,
                    padding: Spacing.xy(32, 12),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FxText.b2("Subtotal", fontWeight: 600),
                    FxText.b2(
                      formatCurrencyRP(subTotal.toString()),
                      letterSpacing: 0.25,
                      fontWeight: 600,
                    ),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FxText.b2("Pengiriman", fontWeight: 600),
                    FxText.b2(
                      formatCurrencyRP(shipping.toString()),
                      letterSpacing: 0.25,
                      fontWeight: 600,
                    ),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b2("Pajak & Biaya ( ${tax.toInt()}% )",
                        fontWeight: 600),
                    FxText.b2(formatCurrencyRP((total * tax / 100).toString()),
                        letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                FxSpacing.height(12),
                FxDashedDivider(
                  dashSpace: 6,
                  height: 1.2,
                  dashWidth: 8,
                  color: AppTheme.theme.colorScheme.onBackground,
                ),
                FxSpacing.height(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FxText.b1("Total", fontWeight: 700),
                    FxText.b1(
                      formatCurrencyRP(total.toString()),
                      letterSpacing: 0.25,
                      fontWeight: 700,
                    ),
                  ],
                ),
              ],
            ),
            FxSpacing.height(24),
            Center(
              child: FxButton.medium(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GroceryCheckoutScreen()));
                },
                child: FxText.button(
                  "CHECKOUT",
                  letterSpacing: 0.5,
                  fontWeight: 600,
                  color: AppTheme.customTheme.groceryOnPrimary,
                ),
                backgroundColor: AppTheme.customTheme.groceryPrimary,
                borderRadiusAll: 4,
                padding: Spacing.xy(32, 12),
                elevation: 2,
              ),
            )
          ],
        ));
  }

  void getSubTotalPrice() {
    double sum = 0;
    for (var e in carts) {
      sum += (e.quantity * e.discountedPrice);
    }
    subTotal = sum;
  }

  void getTotalPrice() {
    getSubTotalPrice();
    total = subTotal + shipping + (total * tax / 100);
  }

  String formatCurrencyRP(String value, {bool withSymbol = true}) {
    final String results = NumberFormat.currency(
      locale: 'id',
      symbol: withSymbol ? 'Rp. ' : '',
      decimalDigits: 2,
    ).format(
      double.parse(value),
    );

    return results;
  }

  void qtyChanged(index, qty) {
    setState(() {
      carts[index].quantity = qty;
      getTotalPrice();
    });
  }

  List<Widget> buildCarts() {
    List<Widget> list = [];

    for (int i = 0; i < carts.length; i++) {
      list.add(
        SingleCartWidget(
          context,
          carts[i],
          (int qty) => qtyChanged(i, qty),
        ),
      );
      if (i + 1 < carts.length) list.add(FxSpacing.height(16));
    }

    return list;
  }
}

class SingleCartWidget extends StatefulWidget {
  final BuildContext rootContext;
  final Cart cart;
  final Function(int) onQuantityChanged;

  // ignore: use_key_in_widget_constructors
  const SingleCartWidget(this.rootContext, this.cart, this.onQuantityChanged);

  @override
  _SingleCartWidgetState createState() => _SingleCartWidgetState();
}

class _SingleCartWidgetState extends State<SingleCartWidget> {
  late int quantity;
  late BuildContext rootContext;

  String? heroKey;

  @override
  void initState() {
    super.initState();
    quantity = widget.cart.quantity;
    rootContext = widget.rootContext;
    heroKey = Generator.getRandomString(10);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: AppTheme.customTheme.groceryBg1,
      ),
      secondaryBackground: Container(
        color: AppTheme.customTheme.groceryBg1,
        padding: Spacing.horizontal(20),
        alignment: AlignmentDirectional.centerEnd,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: Spacing.right(8),
              padding: Spacing.all(16),
              decoration: BoxDecoration(
                  color: AppTheme.customTheme.red.withAlpha(40),
                  shape: BoxShape.circle),
              child: Icon(
                FeatherIcons.trash,
                size: 22,
                color: AppTheme.customTheme.red,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          setState(() {});
        }
      },
      child: FxContainer(
        color: AppTheme.customTheme.groceryBg2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxContainer(
              color: AppTheme.customTheme.groceryPrimary.withAlpha(32),
              padding: Spacing.all(8),
              child: Hero(
                tag: heroKey!,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.cart.image,
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
                  FxText.b1(widget.cart.name, fontWeight: 600),
                  FxSpacing.height(8),
                  widget.cart.discountedPrice != widget.cart.price
                      ? Row(
                          children: [
                            FxText.caption(
                                "Rp " +
                                    FxTextUtils.doubleToString(
                                        widget.cart.price),
                                decoration: TextDecoration.lineThrough,
                                fontWeight: 500),
                            // Space.width(8),
                            FxSpacing.width(8),
                            FxText.b2(
                                "Rp " +
                                    FxTextUtils.doubleToString(
                                        widget.cart.discountedPrice),
                                color: AppTheme.theme.colorScheme.onBackground,
                                fontWeight: 700),
                          ],
                        )
                      : FxText.b2(
                          "Rp " + FxTextUtils.doubleToString(widget.cart.price),
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 700),
                  FxSpacing.height(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FxContainer(
                        onTap: () {
                          widget.onQuantityChanged(quantity);
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                        paddingAll: 8,
                        borderRadiusAll: 4,
                        color:
                            AppTheme.customTheme.groceryPrimary.withAlpha(48),
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
                        padding: Spacing.all(8),
                        borderRadiusAll: 4,
                        onTap: () {
                          widget.onQuantityChanged(quantity);
                          setState(() {
                            quantity++;
                          });
                        },
                        color: AppTheme.customTheme.groceryPrimary,
                        child: Icon(
                          MdiIcons.plus,
                          size: 14,
                          color: AppTheme.customTheme.groceryOnPrimary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
