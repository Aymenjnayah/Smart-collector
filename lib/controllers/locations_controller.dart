import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:smart_collector/routes/app_routes.dart';

class LocationsController extends GetxController {
var myLocationsList = [].obs;

  @override
  void onInit() {
    myLocationsList.addAll([RequestModel(liters: 4, gift: "Pack Nadhif", date: "Mon,Oct 24"), RequestModel(liters: 14, gift: "Pack javel", date: "Wed,Oct 26",)
      ,RequestModel(liters: 7, gift: "Pack rose...", date: "Mon,Oct 31"),RequestModel(liters: 7, gift: "2 pack nadhif", date: "Mon,Nov 04")]);
    super.onInit();
  }

  void addItem() {
    myLocationsList.add(RequestModel(liters: 7, gift: "2 pack lepi...", date: "Mon,Nov 29"));
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
