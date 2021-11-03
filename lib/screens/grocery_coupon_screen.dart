import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import '../styles/shadow.dart';
import '../utils/spacing.dart';
import '../widgets/card/card.dart';
import '../widgets/container/container.dart';
import '../widgets/dotted_line/dotted_line.dart';
import '../widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_theme.dart';

class GroceryCouponScreen extends StatefulWidget {
  const GroceryCouponScreen({Key? key}) : super(key: key);

  @override
  _GroceryCouponScreenState createState() => _GroceryCouponScreenState();
}

class _GroceryCouponScreenState extends State<GroceryCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.customTheme.groceryBg1,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              MdiIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: const FxText.sh1("Kupon", fontWeight: 600),
        ),
        backgroundColor: AppTheme.customTheme.groceryBg1,
        body: ListView(
          padding: Spacing.fromLTRB(24, 8, 24, 0),
          children: <Widget>[
            singleCoupon(MdiIcons.cart, AppTheme.customTheme.purple,
                "Keranjang", "Belanja", 60, "BELANJA!"),
            // Space.height(24),
          ],
        ));
  }

  Widget singleCoupon(IconData iconData, Color color, String company,
      String product, int offer, String code) {
    return FxCard(
      margin: FxSpacing.bottom(16),
      shadow: FxShadow(darkShadow: true),
      padding: Spacing.all(16),
      color: AppTheme.customTheme.groceryBg2,
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: Spacing.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color.withAlpha(200)),
                child: Icon(
                  iconData,
                  color: AppTheme.customTheme.groceryOnPrimary,
                ),
              ),
              FxSpacing.height(8),
              FxText.b1(company, fontWeight: 600),
              FxSpacing.height(4),
              FxText.caption(
                product,
                fontWeight: 500,
                muted: true,
              ),
            ],
          ),
          FxSpacing.width(16),
          FxDottedLine(
            color: AppTheme.theme.colorScheme.onBackground.withAlpha(100),
            height: 100,
            strokeWidth: 1.2,
            dottedLength: 8,
            space: 4,
          ),
          FxSpacing.width(16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.h6(offer.toString() + "%", fontWeight: 700),
                  const FxText.b2("off", fontWeight: 600, xMuted: true),
                ],
              ),
              FxSpacing.height(24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FxText.caption("Kode Promo:",
                      xMuted: true, letterSpacing: -0.2),
                  FxSpacing.width(8),
                  FxContainer(
                    padding: Spacing.fromLTRB(12, 8, 12, 8),
                    borderRadiusAll: 4,
                    color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                    child: FxText.caption(
                      code,
                      letterSpacing: 0,
                      fontWeight: 600,
                      color: AppTheme.customTheme.groceryPrimary,
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
