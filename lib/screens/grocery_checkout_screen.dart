import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../styles/shadow.dart';
import '../themes/app_theme.dart';
import '../utils/spacing.dart';
import '../widgets/button/button.dart';
import '../widgets/card/card.dart';
import '../widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_theme.dart';
import 'grocery_order_screen.dart';

class GroceryCheckoutScreen extends StatefulWidget {
  const GroceryCheckoutScreen({Key? key}) : super(key: key);

  @override
  _GroceryCheckoutScreenState createState() => _GroceryCheckoutScreenState();
}

class _GroceryCheckoutScreenState extends State<GroceryCheckoutScreen>
    with SingleTickerProviderStateMixin {
  int? selectedAddress = 0;
  int? selectedPayment = 0;

  final List<String> _simpleChoice = [
    "Tambah baru",
    "Temukan aku",
    "Kontak",
    "Pengaturan"
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppTheme.customTheme.groceryBg1,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: AppTheme.theme.colorScheme.onBackground,
                size: 20,
              ),
            ),
            title: const FxText.sh1(
              "Checkout",
              fontWeight: 600,
            ),
          ),
          backgroundColor: AppTheme.customTheme.groceryBg1,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  padding: Spacing.fromLTRB(24, 8, 24, 24),
                  children: <Widget>[
                    const FxText.b2("Kirim Ke",
                        fontWeight: 600, letterSpacing: 0),
                    FxSpacing.height(16),
                    getSingleAddress(
                      index: 0,
                      title: "Rumah",
                      address:
                          "Jl. Soreang, Bandung, Jawa Barat, Indonesia 49123",
                    ),
                    // Space.height(16),
                    getSingleAddress(
                      index: 1,
                      title: "Kantor",
                      address: "Jl. Garuda, Garut, Jawa Barat, Indonesia 42132",
                    ),
                    FxSpacing.height(24),
                    const FxText.b2("Metode Pembayaran",
                        fontWeight: 600, letterSpacing: 0),
                    FxSpacing.height(24),
                    getSinglePayment(
                        index: 4,
                        method: "Bayar Di Tempat",
                        image: 'assets/images/cod.png'),
                    // Space.height(16),
                    getSinglePayment(
                        index: 0,
                        method: "Master Card",
                        image: 'assets/images/master-card.png'),
                    // Space.height(16),
                    getSinglePayment(
                        index: 1,
                        method: "Visa Card",
                        image: 'assets/images/visa-card.png'),
                    // Space.height(16),
                    getSinglePayment(
                        index: 2,
                        method: "Paypal",
                        image: 'assets/images/paypal.png'),
                  ],
                ),
              ),
              Container(
                padding: Spacing.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const FxText.b2("Total", fontWeight: 700),
                        const FxText.b2("Rp 99.50",
                            letterSpacing: 0.25, fontWeight: 700),
                      ],
                    ),
                    FxSpacing.height(24),
                    FxButton.block(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GroceryOrderScreen()));
                      },
                      child: FxText.b2(
                        "LANJUTKAN BAYAR",
                        color: AppTheme.customTheme.groceryOnPrimary,
                        letterSpacing: 0.5,
                        fontWeight: 600,
                      ),
                      backgroundColor: AppTheme.customTheme.groceryPrimary,
                      borderRadiusAll: 4,
                      padding: Spacing.y(12),
                      elevation: 0,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget getSingleAddress(
      {int? index, required String title, required String address}) {
    bool isSelected = index == selectedAddress;

    return FxCard(
      onTap: () {
        setState(() {
          selectedAddress = index;
        });
      },
      margin: Spacing.bottom(16),
      shadow: FxShadow(
        elevation: isSelected ? 4 : 0,
      ),
      padding: Spacing.all(16),
      bordered: !isSelected,
      border: Border.all(color: FxAppTheme.customTheme.border2),
      color: isSelected ? FxAppTheme.customTheme.bgLayer1 : Colors.transparent,
      borderRadiusAll: 8,
      child: Row(
        children: [
          isSelected
              ? Container(
                  padding: Spacing.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.customTheme.groceryPrimary.withAlpha(40)),
                  child: Icon(
                    FeatherIcons.mapPin,
                    color: AppTheme.customTheme.groceryPrimary,
                    size: 14,
                  ),
                )
              : Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppTheme.customTheme.groceryPrimary)),
                ),
          FxSpacing.width(isSelected ? 16 : 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(title, fontWeight: 600),
                FxSpacing.height(4),
                FxText.caption(address, fontWeight: 500, muted: true),
              ],
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return _simpleChoice.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: FxText.b2(choice),
                );
              }).toList();
            },
            color: AppTheme.customTheme.groceryBg1,
            child: Icon(
              MdiIcons.dotsVertical,
              color: AppTheme.theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget getSinglePayment(
      {int? index, required String image, required String method}) {
    bool isSelected = index == selectedPayment;

    return FxCard(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      margin: Spacing.bottom(16),
      shadow: FxShadow(
        elevation: isSelected ? 4 : 0,
      ),
      padding: Spacing.all(16),
      bordered: !isSelected,
      border: Border.all(color: FxAppTheme.customTheme.border2),
      color: isSelected ? FxAppTheme.customTheme.bgLayer1 : Colors.transparent,
      borderRadiusAll: 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 48,
            height: 36,
            child: Image.asset(
              image,
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(method, fontWeight: 600),
                FxSpacing.height(8),
                const FxText.overline(
                    "8765  \u2022\u2022\u2022\u2022  \u2022\u2022\u2022\u2022  7983",
                    muted: true,
                    letterSpacing: 0)
              ],
            ),
          ),
          // isSelected ? Space.width(16) : Space.width(20),
          isSelected
              ? Container(
                  padding: Spacing.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.customTheme.groceryPrimary.withAlpha(40)),
                  child: Icon(
                    FeatherIcons.creditCard,
                    color: AppTheme.customTheme.groceryPrimary,
                    size: 14,
                  ),
                )
              : Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppTheme.customTheme.groceryPrimary)),
                ),
        ],
      ),
    );
  }
}
