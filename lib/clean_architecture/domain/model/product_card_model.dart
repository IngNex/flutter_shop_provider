// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_apptesis/clean_architecture/domain/model/products_model.dart';

class ProductCart {
  final Products product;
  int quantity;

  ProductCart({
    required this.product,
    this.quantity = 1,
  });
}
