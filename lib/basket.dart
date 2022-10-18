import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'item.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, Item item, widget) {
      return Scaffold(
          appBar: AppBar(
            title: Text('${item.basket.length}'),
          ),
          body: Stack(
            children: [
              ListView.builder(
                itemCount: item.basket.length,
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
                            child: Image.network(
                              item.basket[index]['image'],
                              fit: BoxFit.contain,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 1.h, top: 1.3.h),
                                width: 25.h,
                                height: 4.h,
                                decoration: BoxDecoration(
                                    //color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(.7.h)),
                                child: Text(
                                  item.basket[index]['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 3.h,
                                      fontWeight: FontWeight.w500),
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 1.h, top: .1.h),
                              //margin: EdgeInsets.,
                              width: 25.h,
                              height: 3.h,
                              decoration: BoxDecoration(
                                  //color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(.7.h)),
                              child: Text(
                                item.basket[index]['description'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 1.9.h,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        // Adet kısmı buraya gelecek
                        // Container(
                        //     margin: EdgeInsets.only(left: 4.h),
                        //     width: 5.h,
                        //     height: 5.h,
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(15)),
                        //     child: Text('alsşdşmsdlş'),
                        //   ),
                        InkWell(
                          onTap: () {
                            item.removeBasket(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 4.h),
                            width: 5.h,
                            height: 5.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(Icons.clear,
                                color: Colors.black, size: 30),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  width: 100.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 18.h,
                        height: 5.h,
                        decoration: BoxDecoration(
                            //color: Colors.white
                            ),
                        child: Center(
                            child: Text(
                          'Toplam Ürün Fiyatı : ',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ),
                      Container(
                        width: 8.h,
                        height: 5.h,
                        decoration: BoxDecoration(
                            //color: Colors.white
                            ),
                        child: Center(
                            child: Text(
                          '${item.price}',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ));
    });
  }
}
