// post_model.dart

import 'package:flutter/material.dart';

class PostModel {
  final String productName;
  final String productImage;
  final String address;
  final String phone;
  final String kg;
  final String price;

  PostModel({
    required this.productName,
    required this.productImage,
    required this.address,
    required this.phone,
    required this.kg,
    required this.price,
  });
}

