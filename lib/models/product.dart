import '../utils/widget_generator.dart';

class Product {
  final String name, description, image;
  final double price, discountedPrice;

  Product(this.name, this.description, this.image, this.price,
      this.discountedPrice);

  static List<Product> getList() {
    return [
      Product(
        "Jeruk Segar",
        Generator.getDummyText(8),
        "assets/images/product-2.png",
        14600,
        11000,
      ),
      Product(
        "Wortel Segar",
        Generator.getDummyText(8),
        "assets/images/product-5.png",
        6700,
        5000,
      ),
      Product(
        "Angur Juicy",
        Generator.getDummyText(8),
        "assets/images/product-3.png",
        43000,
        28000,
      ),
      Product(
        "Brokoli Hijau",
        Generator.getDummyText(8),
        "assets/images/product-1.png",
        11000,
        95000,
      ),
      Product(
        "Kol bunga",
        Generator.getDummyText(8),
        "assets/images/product-4.png",
        16000,
        15400,
      ),
    ];
  }
}
