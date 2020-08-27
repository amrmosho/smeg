import 'package:flutter/cupertino.dart';
import 'package:Smeg/ins/net.dart';
import 'package:Smeg/models/orders.dart';
import 'package:Smeg/models/products.dart';
import 'package:Smeg/models/products_categories.dart';
import 'package:Smeg/models/sys_site_config.dart';
import 'content.dart';
import 'content_categories.dart';
import 'dart:io';

enum SheckDataStatus { updated, sameVersion, disconnect, haveData }

class AppData {
  static Future<void> sheckData(BuildContext context, {Function stat}) async {
    SiteConfig.chekVersion((is_online, is_have_date, is_sameveroin) {
      if (is_online) {
        Orders.update(context, onDone: (data) {
          if (!is_sameveroin) {
            ProductsCategories.update(onDone: (data) {
              Product.update(onDone: (data) {
                ContentCategories.update(onDone: (data) {
                  Content.update(onDone: (data) {
                    SiteConfig.update(onDone: (data) {
                      stat(SheckDataStatus.updated);
                    });
                  });
                });
              });
            });
          } else {
            stat(SheckDataStatus.sameVersion);
          }
        });
      } else {
        if (is_have_date) {
          stat(SheckDataStatus.haveData);
        } else {
          stat(SheckDataStatus.disconnect);
        }
      }

      stat(SheckDataStatus.sameVersion);
    });
  }
}
