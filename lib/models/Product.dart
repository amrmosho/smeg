import 'package:flutter/material.dart';
import 'package:shop_app/ins/data_types.dart';

List<Content> categories = [
  Content(
    id: 1,
    title: "Appliances",
    image: "assets/categories/appliances.svg",
  ),
  Content(
    id: 2,
    title: "Coffee Maker",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    id: 7,
    title: "Washers",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    id: 3,
    title: "Cooker",
    image: "assets/categories/appliances.svg",
  ),
  Content(
    id: 4,
    title: "Dishwasher",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    id: 5,
    title: "Fredge",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    id: 6,
    title: "Toaster",
    image: "assets/categories/redge.svg",
  ),
  Content(
    id: 5,
    cat_id: "7",
    title: "Fredge",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    id: 6,
    cat_id: "7",
    title: "Toaster",
    image: "assets/categories/redge.svg",
  ),
  Content(
    id: 8,
    title: "POPULAR PRODUCTS",
    image: "assets/categories/appliances.svg",
  ),
  Content(
    id: 9,
    title: "Week Promotion",
    image: "assets/categories/appliances.svg",
  ),
  Content(
    id: 10,
    title: "New PRODUCTS",
    image: "assets/categories/appliances.svg",
  ),
];

List<Content> products = [
  Content(
      id: 1,
      images:
          "assets/images/washers/slb147_1.jpg,assets/images/washers/slb147_2.jpg,assets/images/washers/slb147_3.jpg",
      cat_id: "8,7,9",
      title: "lst147",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/washers/lst147_thum.png",
      color: Color(0xFFcccccc)),
  Content(
      id: 3,
      cat_id: "7",
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Content(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      cat_id: "4,8,7",
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Content(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      cat_id: "9,8,7",
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Content(
    id: 6,
    cat_id: "9,8,7",
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
