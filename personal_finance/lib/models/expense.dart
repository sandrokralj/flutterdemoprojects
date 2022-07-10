import 'package:flutter/material.dart';

class Expense {
  final String category;
  final double value;
  final Color color;

  const Expense(this.category, this.value, this.color);
}