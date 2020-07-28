import 'package:flutter/material.dart';
import 'package:shop_app/ins/data_types.dart';

List<Content> categories = [
  Content(
    title: "Appliances",
    image: "assets/categories/appliances.svg",
  ),
  Content(
    title: "Coffee Maker",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    title: "Cooker",
    image: "assets/categories/appliances.svg",
  ),
  Content(
    title: "Dishwasher",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    title: "Fredge",
    image: "assets/categories/dishwasher.svg",
  ),
  Content(
    title: "Toaster",
    image: "assets/categories/redge.svg",
  ),
  Content(
    title: "Wash machine",
    image: "assets/categories/redge.svg",
  ),
];

List<Content> news = [
  Content(
    description: dummyText,
    image: "assets/images/ads_1.jpeg",
  ),
  Content(
    description: dummyText,
    image: "assets/images/ads_2.jpg",
  ),
  Content(
    description: dummyText,
    image: "assets/images/ads_3.jpg",
  ),
  Content(
    description: dummyText,
    image: "assets/images/ads_4.jpg",
  ),
  Content(
    description: dummyText,
    image: "assets/images/ads_5.jpg",
  ),
];

List<Content> products = [
  Content(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Content(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Content(
      id: 3,
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
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Content(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Content(
    id: 6,
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
