import 'package:ecommerce/view/brands/brand_cat_view.dart';
import 'package:ecommerce/view/category/cateogry_product.dart';
import 'package:ecommerce/view/products/products_view2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryView extends StatelessWidget {
  List<String> names = <String>[
    "men",
    "women",
    "m",
    "m",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.only(left: 12, right: 12, top: 25),
          itemCount: names.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: InkWell(
              onTap: () {},
              child: Stack(alignment: Alignment.center, children: [
                InkWell(
                  onTap: () {
                    Get.to(ProductsView());
                  },
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "http://adolfo.com/wp-content/uploads/2014/08/front-image-3.jpg",
                            ))),
                  ),
                ),
                Text(
                  "Man",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ]),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 25,
          ),
        ),
      ),
    );
  }
}
