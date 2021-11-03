import 'dart:ui';

import '../models/product.dart';
import '../utils/widget_generator.dart';
import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../utils/spacing.dart';
import '../utils/text_utils.dart';
import '../widgets/container/container.dart';
import '../widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../app_theme_notifier.dart';
import 'grocery_category_screen.dart';
import 'grocery_notification_dialog.dart';
import 'grocery_single_product_screen.dart';
import '../models/category.dart';

class GroceryHomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryHomeScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryHomeScreenState createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen>
    with SingleTickerProviderStateMixin {
  late List<Category> categories;
  late List<Product> products;

  @override
  initState() {
    super.initState();
    categories = Category.getList();
    products = Product.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.customTheme.groceryBg1,
            body: ListView(
              padding: Spacing.fromLTRB(0, 48, 0, 70),
              children: <Widget>[
                Padding(
                  padding: FxSpacing.horizontal(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.h6("Selamat Datang!",
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return const NotificationDialog();
                              },
                              fullscreenDialog: true));
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Icon(
                              FeatherIcons.bell,
                              size: 22,
                              color: AppTheme.theme.colorScheme.onBackground
                                  .withAlpha(200),
                            ),
                            Positioned(
                              right: -2,
                              top: -2,
                              child: Container(
                                padding: Spacing.zero,
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    color: AppTheme.customTheme.groceryPrimary,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(40))),
                                child: Center(
                                  child: FxText.overline(
                                    "2",
                                    color:
                                        AppTheme.customTheme.groceryOnPrimary,
                                    fontSize: 9,
                                    fontWeight: 500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                FxSpacing.height(8),
                Padding(
                  padding: FxSpacing.horizontal(24),
                  child: FxText.b2("Apa yang akan kamu beli hari ini?",
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 500,
                      xMuted: true),
                ),
                FxSpacing.height(24),
                getBannerWidget(),
                FxSpacing.height(24),
                Padding(
                  padding: FxSpacing.horizontal(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.sh1("Kategori",
                          letterSpacing: 0,
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600),
                      FxText.caption("Lihat Semua",
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600,
                          xMuted: true,
                          letterSpacing: 0),
                    ],
                  ),
                ),
                FxSpacing.height(16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: buildCategories(),
                  ),
                ),
                FxSpacing.height(24),
                Padding(
                  padding: FxSpacing.horizontal(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.sh1("Penjualan Terbaik",
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600),
                      FxText.caption("Lihat Semua",
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600,
                          xMuted: true,
                          letterSpacing: 0),
                    ],
                  ),
                ),
                FxSpacing.height(16),
                Padding(
                  padding: FxSpacing.horizontal(24),
                  child: Column(
                    children: buildProducts(),
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget getBannerWidget() {
    return FxContainer(
      color: AppTheme.customTheme.groceryPrimary.withAlpha(28),
      padding: Spacing.all(24),
      margin: FxSpacing.horizontal(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.b1("Nikmati penawaran spesial\nhingga 60%",
              color: AppTheme.customTheme.groceryPrimary,
              fontWeight: 600,
              letterSpacing: 0),
          FxSpacing.height(8),
          FxText.caption("pada 15 - 25 Maret 2021",
              color: AppTheme.theme.colorScheme.onBackground.withAlpha(100),
              fontWeight: 500,
              letterSpacing: -0.2),
        ],
      ),
    );
  }

  List<Widget> buildCategories() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));
    for (int i = 0; i < categories.length; i++) {
      list.add(getSingleCategory(categories[i]));
      list.add(FxSpacing.width(16));
    }
    return list;
  }

  Widget getSingleCategory(Category category) {
    String heroTag = Generator.getRandomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 80,
        onTap: () {
          Navigator.push(
              widget.rootContext,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) =>
                      GroceryCategoryScreen(context, category, heroTag)));
        },
        padding: Spacing.all(16),
        color: category.color,
        child: Column(
          children: [
            Image.asset(
              category.image,
              width: 28,
              height: 28,
            ),
            FxSpacing.height(4),
            FxText.overline(
              category.title,
              color: AppTheme.theme.colorScheme.onBackground,
            )
          ],
        ),
      ),
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
