import 'package:flutter/material.dart';

// Just a blueprint required to holdthe values ofthe data 

class Category {
  const Category({
    required this.id,
    required this.title,
    required this.color,
  });

  final String id;
  final String title;
  final Color color;


}