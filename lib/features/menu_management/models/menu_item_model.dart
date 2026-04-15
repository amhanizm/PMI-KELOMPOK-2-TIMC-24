import 'package:flutter/material.dart';

class MenuItemModel {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color iconColor;
  bool isActive;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    this.iconColor = const Color(0xFF0035B8),
    this.isActive = true,
  });
}