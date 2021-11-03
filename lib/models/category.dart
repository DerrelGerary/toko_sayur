import 'package:flutter/cupertino.dart';
import '../themes/app_theme.dart';

class Category {
  final String image, title;
  final Color color;

  Category(this.image, this.title, this.color);

  static List<Category> getList() {
    return [
      Category("assets/images/strawberry.png", "Buah",
          FxAppTheme.customTheme.red.withAlpha(50)),
      Category("assets/images/bread.png", "Roti",
          FxAppTheme.customTheme.orange.withAlpha(60)),
      Category("assets/images/broccoli.png", "Sayuran",
          FxAppTheme.customTheme.green.withAlpha(50)),
      Category("assets/images/cheese.png", "Susu",
          FxAppTheme.customTheme.yellow.withAlpha(70)),
    ];
  }
}
