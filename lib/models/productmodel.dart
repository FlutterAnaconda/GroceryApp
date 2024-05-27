class ProductModel {
  String? title;
  String? image;
  String? subtitle;
  int? price;
  int? rating;
  String? location;
  bool isfav;
  String? status;
  bool? discount;
  bool? outofstock;
  int? quantity;

  ProductModel(
      {this.title,
      this.image,
      this.price,
      this.rating,
      this.location,
      this.subtitle,
      this.status,
        this.outofstock=false,
        this.quantity=25,
        this.discount=false,
      this.isfav = false});
}
