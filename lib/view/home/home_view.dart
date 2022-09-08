import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/notification/onesignal.dart';
import 'package:ecommerce/notification/test_notofication.dart';
import 'package:ecommerce/services/data_controller.dart';
import 'package:ecommerce/view/brands/brand_cat_view.dart';
import 'package:ecommerce/view/brands/brands_view2.dart';
import 'package:ecommerce/view/brands/offers_brands.dart';
import 'package:ecommerce/view/cart/cart_view.dart';
import 'package:ecommerce/view/category/category.dart';
import 'package:ecommerce/view/category/cateogry_product.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/view/products/products_view.dart';
import 'package:ecommerce/view/products/products_view2.dart';
import 'package:ecommerce/view/profile/profile_view.dart';
import 'package:ecommerce/view/widgets/slider_drawer.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/view/search/search_view.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:status_change/status_change.dart';
import '../widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  final urlImages = [
    "https://v-genius.fatafeat.com/storage/attachments/20/Fatafeat-24sept-article2_756316.png/r/800/Fatafeat-24sept-article2_756316.png",
    "https://tijaratuna.com/wp-content/uploads/2020/08/pexels-photo-2447042-e1598880669824-630x300.jpeg",
    "https://www.civgrds.com/projects/wp-content/uploads/2019/10/%D9%85%D8%B4%D8%B1%D9%88%D8%B9-%D9%85%D8%AD%D9%84-%D8%A7%D9%83%D8%B3%D8%B3%D9%88%D8%A7%D8%B1%D8%A7%D8%AA.webp",
    "https://www.fatakat-a.com/wp-content/uploads/%D8%B5%D9%88%D8%B1-%D8%AF%D8%B1%D9%8A%D8%B3%D8%A7%D8%AA-%D9%85%D8%AD%D8%AC%D8%A8%D8%A7%D8%AA-%D8%B7%D9%88%D9%8A%D9%84%D8%A9-%D8%B1%D8%A8%D9%8A%D8%B9-2022.jpg",
    "https://cdn4.premiumread.com/?url=https://www.alroeya.com/uploads/images/2022/01/30/1479522.jpg&w=w850&q=100&f=jpg",
  ];

  String email;

  HomeView({this.email});

  bool isExecuted = false;

  String get urlImage => null;
  List<String> names = <String>[
    "men",
    "women",
    "m",
    "m",
    "m",
  ];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeViewModel());
    TextEditingController search_txt = new TextEditingController();
    QuerySnapshot querySnapshot;
    final box = GetStorage();
    //  final box_name=box.read('name').replaceAll('@','').replaceAll('yahoo.com','').replaceAll('gmail.com','').replaceAll('hotmail.com','');
    // final username=user.displayName;
    // final userData =FirebaseFirestore.instance.collection('users').doc(user.displayName).get();
    Get.put(HomeViewModel());
    Get.put(AuthViewModel());
    Widget searchedData() {
      return ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(querySnapshot.docs[index].data()['image']),
              ),
              title: Text(querySnapshot.docs[index].data()['name']),
            );
          });
    }

    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Shopping App"),
                centerTitle: true,
                toolbarHeight: 70,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.pink],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                // title: Container(
                //     height: 30,
                //     child: Center(
                //         child: Row(
                //       children: [
                //         SizedBox(
                //             width: MediaQuery.of(context).size.width * 0.60),
                //         SizedBox(width: 5),
                //       ],
                //     ))),
              ),
              drawer: Drawer(
                child: Container(
                  child: Column(
                    children: [
                      SidebarPage(),
                      MyDrawerList(),
                    ],
                  ),
                ),
              ),
              body
                  // : isExecuted
                  // ? searchedData
                  //
                  // :
                  : Container(
                padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                child: ListView(children: [
                  SizedBox(height: 20),
//                         Container(
//                           height:66,
//                           child:Card(
//                               child: Row(
//                                 children: [
//                                   SizedBox(width: 12),
//                                   Center(
//                             child: Row(
//                               children: [
//
//                                 Text("                                                           ",
//                                     style:TextStyle(
//                                         color: Colors.black,
//                                         fontSize:13,
//                                         //  fontStyle:FontStyle.italic,
//                                         fontWeight:FontWeight.w800
//                                     )),
//                                 SizedBox(
//                                     width:3
//                                 ),
//
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:8.0),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(width:6),
//                                       Text(box_name.toString() ,
//                                         style:TextStyle(
//                                             color: Colors.red,
//                                             fontSize:17,
//                                             //  fontStyle:FontStyle.italic,
//                                             fontWeight:FontWeight.w700
//                                         ),
//                                       ),
//
//                                       Text("   اهلا و سهلا  يا  ",
//                                       style:TextStyle(
//                                             color: Colors.black,
//                                             fontSize:16,
//                                           //  fontStyle:FontStyle.italic,
//                                             fontWeight:FontWeight.bold
//                                       ),
// ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                                   SizedBox(width:6),
//
//
//                                 ],
//                               ))
//                         ),
                  // SizedBox(height: 10),
                  GetBuilder<DataController>(
                    init: DataController(),
                    builder: (controller) => _searchTextFormField(),
                  ),
                  SizedBox(height: 30),

                  Container(
                      child: Center(
                          child: CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 170,
                      autoPlay: true,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                      autoPlayInterval: Duration(
                        seconds: 2,
                      ),
                    ),
                  ))),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      Custom_Text(
                        text: "Catogories",
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewCategory2(),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Custom_Text(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(ProductsView());
                            },
                            child: Custom_Text(
                              text: "See all",
                              color: Colors.pinkAccent,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts2()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // Row(children: [
                  //   InkWell(
                  //       child: Custom_Text(
                  //           text: "عرض الكل",
                  //           fontSize: 16,
                  //           color: Colors.blue.shade200),
                  //       onTap: () {
                  //         Get.to(ProductsView());

                  //         // controller.categoryModel[index].name
                  //         //   AllProductsView()
                  //       }),
                  //   SizedBox(
                  //     width: 131,
                  //   ),
                  //   Spacer(),
                  //   Custom_Text(
                  //     text: "  المنتجات  ",
                  //     fontSize: 16,
                  //   ),
                  // ]),
                  // SizedBox(height: 40),
                  // _listViewProducts(),
                ]),
              )),
    );
  }

  Widget _searchTextFormField() {
    TextEditingController search_txt = new TextEditingController();
    QuerySnapshot querySnapshot;
    // bool isExecuted = false;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: GetBuilder<DataController>(
          init: DataController(),
          builder: (controller) => TextFormField(
                controller: search_txt,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: InkWell(
                      child: Icon(Icons.search, color: Colors.black),
                      onTap: () {
                        controller.queryData(search_txt.text).then((value) {
                          querySnapshot = value;
                          isExecuted = true;
                          print("issss" + isExecuted.toString());
                          print("qqq=" + querySnapshot.docs.toString());
                          print("sss=" + search_txt.text.toString());
                          Get.to(SearchView(
                            search_txt: search_txt.text.toString(),
                          ));
                        });
                      }),
                ),
              )
          //}
          ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 160,
        child: ListView.separated(
          itemCount: 4, //controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  width: 95,
                  height: 107,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                          height: 90,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                controller.categoryModel[index].image),
                            // child: Image.network(
                            //     controller.categoryModel[index].image),
                          )),
                      onTap: () {
                        print("br: " + controller.categoryModel[index].name);
                        Get.to(ProductsView(
                            cat: controller.categoryModel[index].name));
                        // Get.to(ProductScreen(
                        //     productmodel: controller.productModel,
                        //     brand: controller.categoryModel[index].namecontroller.categoryModel[index].name));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Custom_Text(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewCat() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                child: Column(
                  children: [
                    Container(
                        width: 95,
                        height: 107,
                        child: CircleAvatar(
                            backgroundColor: Colors.blue.shade200,
                            // backgroundImage:AssetImage('assets/w1.png')),
                            child: Image.asset(
                              'assets/w1.png',
                              fit: BoxFit.contain,
                            ))),
                    SizedBox(height: 10),
                    Text(
                      "ملابس رجالي",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                onTap: () {
                  Get.to(ProductsView(cat: "men"));
                },
              ),
              SizedBox(width: 33),
              InkWell(
                child: Column(
                  children: [
                    Container(
                        width: 95,
                        height: 107,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue.shade200,
                          child: Image.asset(
                            'assets/w2.png',
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                    SizedBox(height: 10),
                    Text(
                      "ملابس حريمي",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                onTap: () {
                  Get.to(ProductsView(cat: "women"));
                },
              ),
              SizedBox(width: 33),
              InkWell(
                child: Column(
                  children: [
                    Container(
                        width: 95,
                        height: 107,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue.shade200,
                          child: Image.asset(
                            'assets/a.jpg',
                            fit: BoxFit.fitHeight,
                          ),

                          // backgroundImage:AssetImage('assets/w33.png'),
                        )),
                    SizedBox(height: 10),
                    Text(
                      "اكسسوارات ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                onTap: () {
                  Get.to(ProductsView(cat: "Acx"));
                },
              ),
              SizedBox(width: 22),
              SizedBox(width: 22),
            ],
          )),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 245,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                //height:40,
                // width: MediaQuery.of(context).size.width * .4,
                child: InkWell(
                  child: Card(
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              height: 160,
                              child: Container(
                                // height: 250,
                                child: Image.network(
                                  controller.productModel[index].image,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(DetailsView2(
                                name: controller.productModel[index].name,
                                price: controller.productModel[index].price,
                                //      x:posts.data()['x'],
                                details: controller.productModel[index].des,
                                image: controller.productModel[index].image,
                                productId:
                                    controller.productModel[index].productId,
                                size: controller.productModel[index].size,
                                color: controller.productModel[index].color,
                                //    brand:posts.data()['brand'],
                                //  brandemail:posts.data()['brandemail']
                              ));
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Custom_Text(
                          text: controller.productModel[index].name.toString(),
                          alignment: Alignment.bottomLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Custom_Text(
                                text: controller.productModel[index].price
                                        .toString() +
                                    " ",
                                alignment: Alignment.bottomLeft,
                                color: Colors.blue[600]),
                            Custom_Text(
                                text: "  L.E",
                                alignment: Alignment.bottomLeft,
                                color: Colors.blue[600]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(DetailsView2(
                      name: controller.productModel[index].name,
                      price: controller.productModel[index].price,
                      //      x:posts.data()['x'],
                      details: controller.productModel[index].des,
                      image: controller.productModel[index].image,
                      productId: controller.productModel[index].productId,
                      //    brand:posts.data()['brand'],
                      //  brandemail:posts.data()['brandemail']
                    ));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(),
        ],
      ),
    );
  }

  Widget menuItem() {
    return Material(
      child: InkWell(
        onTap: () {
          Get.to(ProfileView());
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                Icons.notification_important_outlined,
                size: 20,
                color: Colors.black,
              )),
              Expanded(
                  flex: 3,
                  child: Text(
                    "Notification",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory2() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: names.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/men.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Custom_Text(
                  text: names[index],
                  color: Colors.pinkAccent,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts2() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 320,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                            )
                          ]),
                      child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          height: 220,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Custom_Text(
                      text: controller.productModel[index].name.toString(),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Custom_Text(
                      text: controller.productModel[index].price.toString() +
                          " L.E",
                      color: Colors.pinkAccent,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(
                urlImage,
              ),
              fit: BoxFit.cover)),
    );

enum DrwaerSection {
  dashboard,
  Catogary,
  Your_Products,
  Notfication,
  EditProfile,
}
