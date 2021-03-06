import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../themes/app_theme.dart';
import '../utils/spacing.dart';
import '../widgets/container/container.dart';
import '../widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_theme.dart';

class GroceryOrderScreen extends StatefulWidget {
  const GroceryOrderScreen({Key? key}) : super(key: key);

  @override
  _GroceryOrderScreenState createState() => _GroceryOrderScreenState();
}

class _GroceryOrderScreenState extends State<GroceryOrderScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: FxAppTheme.customTheme.bgLayer2,
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
            title: const FxText.sh1("Pesanan", fontWeight: 600),
          ),
          body: Container(
            color: FxAppTheme.customTheme.bgLayer2,
            child: ListView(
              padding: Spacing.fromLTRB(24, 8, 24, 0),
              children: [
                singleOrderItem(
                    price: 49.49,
                    time: "12 April 2020, 1:45",
                    listItem: [
                      "assets/images/product-1.png",
                      "assets/images/product-2.png",
                      "assets/images/product-3.png",
                      "assets/images/product-4.png",
                    ],
                    number: 4568,
                    status: "Sedang berlangsung"),
                singleOrderItem(
                    price: 54.99,
                    time: "14 Feb 2020, 12:04",
                    listItem: [
                      "assets/images/product-5.png",
                      "assets/images/product-3.png",
                    ],
                    number: 1478,
                    status: "Dikirim"),
                singleOrderItem(
                    price: 69.99,
                    time: "16 Dec 2019, 8:48",
                    listItem: [
                      "assets/images/product-4.png",
                      "assets/images/product-1.png",
                      "assets/images/product-2.png",
                    ],
                    number: 1123,
                    status: "Dikirim"),
              ],
            ),
          )),
    );
  }

  Widget singleOrderItem(
      {required List<String> listItem,
      int? number,
      String? time,
      String? status,
      double? price}) {
    //Logic for row items
    double space = 16;

    List<Widget> _itemWidget = [];
    for (int i = 0; i < listItem.length; i++) {
      if (i == 2 && listItem.length > 3) {
        _itemWidget.add(
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
              height: 80,
              width: 80,
              child: Center(
                  child: FxText.sh1("+" + (listItem.length - 2).toString(),
                      letterSpacing: 0.5,
                      color: AppTheme.customTheme.groceryPrimary,
                      fontWeight: 600)),
            ),
          ),
        );
        break;
      } else {
        _itemWidget.add(
          FxContainer(
            margin: (i == 2) ? FxSpacing.zero : FxSpacing.right(space),
            padding: FxSpacing.all(12),
            color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                listItem[i],
                height: 56,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
    }

    return FxContainer(
      padding: Spacing.all(16),
      margin: Spacing.bottom(16),
      color: AppTheme.customTheme.bgLayer1,
      bordered: true,
      border: Border.all(color: FxAppTheme.customTheme.border2, width: 1.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.b1("Order $number",
                        fontWeight: 600, letterSpacing: -0.2),
                    FxSpacing.height(4),
                    FxText.b2(
                      "Rp  $price",
                      fontWeight: 600,
                    ),
                  ],
                ),
              ),
              FxContainer(
                padding: Spacing.fromLTRB(12, 8, 12, 8),
                color: FxAppTheme.customTheme.bgLayer1,
                borderRadiusAll: 4,
                child: FxText.overline(status!.toUpperCase(),
                    fontWeight: 700, letterSpacing: 0.2),
              )
            ],
          ),
          FxSpacing.height(16),
          FxText.caption(
            time!,
            muted: true,
          ),
          FxSpacing.height(16),
          Wrap(
            children: _itemWidget,
          ),
        ],
      ),
    );
  }
}
