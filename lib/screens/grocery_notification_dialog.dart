import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../themes/text_style.dart';
import '../utils/spacing.dart';
import '../widgets/button/button.dart';
import '../widgets/container/container.dart';
import '../widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_theme.dart';

class NotificationDialog extends StatefulWidget {
  const NotificationDialog({Key? key}) : super(key: key);

  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const FxText.sh1("Notifikasi", fontWeight: 600),
          actions: <Widget>[
            Container(
              margin: Spacing.right(16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.notificationClearAll,
                  size: 24,
                  color: AppTheme.theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: Spacing.all(16),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const FxText.b1(
                  "Penawaran",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: Spacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: FxText.overline(
                    "2",
                    fontWeight: 600,
                    color: AppTheme.customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            Spacing.height(24),
            singleNotification(
                image: 'assets/images/product-5.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "50% OFF ",
                        style: FxTextStyle.button(
                            color: AppTheme.customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                      text: "di ultraboost semua sepatu puma ltd",
                      style: FxTextStyle.button(
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 500,
                          letterSpacing: 0.2),
                    )
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            singleNotification(
                image: 'assets/images/product-2.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "30% OFF ",
                        style: FxTextStyle.button(
                            color: AppTheme.customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                        text: "di semua kue sampai 31 Juli",
                        style: FxTextStyle.button(
                            color: AppTheme.theme.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const FxText.b1(
                  "Pesanan",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: Spacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: FxText.overline(
                    "8",
                    fontWeight: 600,
                    color: AppTheme.customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: 'assets/images/product-3.png',
                text: FxText.button("Pesanan kue Anda telah dikirim di Jakarta",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "Baru Saja"),
            FxSpacing.height(24),
            singleNotification(
                image: 'assets/images/product-2.png',
                text: FxText.button(
                    "pesanan terakhir telah dibatalkan oleh penjual",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "14 Juli"),
            FxSpacing.height(24),
            Center(
              child: FxButton.text(
                splashColor: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                child: FxText.button("Lihat Semua",
                    color: AppTheme.customTheme.groceryPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.2),
                onPressed: () {},
              ),
            ),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const FxText.b1(
                  "Keamanan",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: Spacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: FxText.overline(
                    "1",
                    fontWeight: 600,
                    color: AppTheme.customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: 'assets/images/profile.png',
                text: FxText.button("Kata sandi akun Anda telah diubah",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "2 hari yang lalu"),
          ],
        ),
      ),
    );
  }

  Widget singleNotification(
      {required String image, Widget? text, required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FxContainer.rounded(
          width: 52,
          height: 52,
          padding: Spacing.all(10),
          color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
          child: Image.asset(image),
        ),
        Expanded(
          child: Container(margin: Spacing.horizontal(16), child: text),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FxText.caption(time,
                muted: true, fontWeight: 500, letterSpacing: -0.2),
          ],
        )
      ],
    );
  }
}
