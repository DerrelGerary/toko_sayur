import 'dart:ui';

import '../utils/widget_generator.dart';
import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../utils/spacing.dart';
import '../utils/text_utils.dart';
import '../widgets/container/container.dart';
import '../widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_theme.dart';
import 'grocery_single_product_screen.dart';
import '../models/category.dart';
import '../models/product.dart';

class GroceryCategoryScreen extends StatefulWidget {
  final BuildContext rootContext;
  final Category category;
  final String heroTag;

  // ignore: use_key_in_widget_constructors
  const GroceryCategoryScreen(this.rootContext, this.category, this.heroTag);

  @override
  _GroceryCategoryScreenState createState() => _GroceryCategoryScreenState();
}

class _GroceryCategoryScreenState extends State<GroceryCategoryScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;

  @override
  initState() {
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
          backgroundColor: AppTheme.customTheme.groceryBg1,
          appBar: AppBar(
            backgroundColor: AppTheme.customTheme.groceryBg1,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: AppTheme.theme.colorScheme.onBackground,
              ),
            ),
          ),
          body: ListView(
            padding: Spacing.fromLTRB(24, 0, 24, 0),
            children: <Widget>[
              Column(
                children: [
                  Hero(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: widget.category.color,
                      ),
                      padding: Spacing.all(20),
                      child: Image.asset(
                        widget.category.image,
                        width: 52,
                        height: 52,
                      ),
                    ),
                  ),
                  FxSpacing.height(16),
                  FxText.sh1(
                    widget.category.title,
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 600,
                  )
                ],
              ),
              FxSpacing.height(24),
              Column(
                children: buildProducts(),
              )
            ],
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
            widget.rootContext,
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
