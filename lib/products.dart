import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/basket.dart';
import 'package:providerapp/item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, Item item, widget) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sepetteki Ürün | ${item.basket.length} |'),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const BasketScreen(),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        textAlign: TextAlign.center, 'Sepetimdeki Ürünler')),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 90
                  .h, // ekranın %80 kendi kütüphanesi içerisinde bunu görebiliriz
              width: 100.w, // ekranın %100 alıyor.
              child: ListView.builder(
                itemCount: item.product.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.w,
                    height: 10.h,
                    margin: EdgeInsets.only(bottom: 1.h),
                    padding: EdgeInsets.only(right: 3.w, left: 3.w),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 10.h,
                          height: 10.h,
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              borderRadius: BorderRadius.circular(.7.h)),
                          child: Image.network(item.product[index]['image'],fit: BoxFit.contain,)
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 1.h,top: 1.3.h),
                              width: 25.h,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  //color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(.7.h)),
                              child: Text(item.product[index]['title'],style: TextStyle(color: Colors.white,fontSize: 3.h,fontWeight: FontWeight.w500),)
                            ),
                            Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 1.h,top: .1.h),
                            //margin: EdgeInsets.,
                            width: 25.h,
                            height: 3.h,
                            decoration: BoxDecoration(
                                //color: Colors.yellow,
                                borderRadius: BorderRadius.circular(.7.h)),
                            child: Text(item.product[index]['description'],style: TextStyle(color: Colors.white,fontSize: 1.9.h,fontWeight: FontWeight.w500),),
                          ),
                            
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            item.addBasket(item.product[index]);
                            //item.sameObject(item.product[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 4.h),
                            width: 4.h,
                            height: 4.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(.7.h)),
                            child: Icon(Icons.add_shopping_cart_rounded),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}