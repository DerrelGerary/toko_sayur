class Cart {
  final String name, image;
  final double price, discountedPrice;
  int quantity;

  Cart(this.name, this.image, this.price, this.discountedPrice, this.quantity);

  static List<Cart> getList() {
    return [
      Cart(
        "Jeruk Segar",
        "assets/images/product-2.png",
        14600,
        12000,
        2,
      ),
      Cart(
        "Wortel Segar",
        "assets/images/product-5.png",
        9100,
        8000,
        4,
      ),
    ];
  }
}
