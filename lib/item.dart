import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier{

  String get price => "${double.parse(getPrice().toString())} ₺";

  //int itemCount = 0;

  List product = [
  {
    "image" : "https://www.arcelik.com.tr/media/resize/7965101600_LO1_20201126_155939.png/1000Wx1000H/image.png",
    "title" : "Telefon 1",
    "description" : "açıklama yazısı 1",
    "price" : 150
  },
  {
    "image" : "https://www.arcelik.com.tr/media/resize/7966721600_LO1_20210524_094810.png/1000Wx1000H/image.png",
    "title" : "Telefon 2",
    "description" : "açıklama yazısı 2",
    "price" : 120
  },
  {
    "image" : "https://www.arcelik.com.tr/media/resize/7965171600_LO1_20201126_160607.png/1000Wx1000H/image.png",
    "title" : "Telefon 3",
    "description" : "açıklama yazısı 3",
    "price" : 300
  },
  {
    "image" : "https://www.arcelik.com.tr/media/resize/7965081600_LO1_20201126_155819.png/1000Wx1000H/image.png",
    "title" : "Telefon 4",
    "description" : "açıklama yazısı 4",
    "price" : 750
  }];

  List basket = [];

  void addBasket(Object value){
    basket.add(value);
    notifyListeners();
  }

  void removeBasket(int value){
    basket.removeAt(value); 
    notifyListeners();
  }

  double getPrice(){
    double price = 0;
    for (var i = 0; i < basket.length; i++) {
      price += basket[i]["price"];
    }
    return price;
  }
}