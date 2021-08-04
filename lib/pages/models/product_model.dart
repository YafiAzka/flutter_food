enum Category { fastFood, dessert, drinks, snacks }

class ProductModel {
  int? id;
  String? title;
  String? image;
  String? price;
  List<Category>? category;

  ProductModel({
    this.id,
    this.title,
    this.image,
    this.price,
    this.category = const [],
  });

  List<ProductModel> productModel = [
    ProductModel(
      id: 0,
      title: 'Pizza',
      image: 'assets/pizza.png',
      price: 'IDR 49.999',
      category: [Category.fastFood],
    ),
    ProductModel(
      id: 1,
      title: 'Hamburger',
      image: 'assets/hamburger.png',
      price: 'IDR 59.999',
      category: [Category.fastFood, Category.dessert],
    ),
    ProductModel(
      id: 0,
      title: 'Double Hot Dogs',
      image: 'assets/hotdog.png',
      price: 'IDR 34.999',
      category: [Category.snacks],
    ),
  ];
}
