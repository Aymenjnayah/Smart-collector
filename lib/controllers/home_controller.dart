
import 'package:get/get.dart';

class HomeController extends GetxController{
  var myList = [].obs;

  @override
  void onInit() {
    myList.addAll([RequestModel(liters: 4, gift: "Pack Nadhif", date: "Mon,Oct 24"), RequestModel(liters: 14, gift: "Pack javel", date: "Wed,Oct 26",)
      , RequestModel(liters: 7, gift: "Pack rose...", date: "Mon,Oct 31"),RequestModel(liters: 7, gift: "2 pack nadhif", date: "Mon,Nov 04")]);
    super.onInit();
  }

  void addItem() {
    myList.add(RequestModel(liters: 7, gift: "2 pack lepi...", date: "Mon,Nov 29"));
  }
}

class RequestModel {
  int? liters;
  String? gift;
  String? date;

  RequestModel({this.liters, this.gift, this.date});

  // RequestModel.fromJson(Map<String, dynamic> json) {
  //   liters = json['liters'];
  //   gift = json['gift'];
  //   date = json['date'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['liters'] = this.liters;
  //   data['gift'] = this.gift;
  //   data['date'] = this.date;
  //   return data;
  // }
}
