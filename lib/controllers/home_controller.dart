class HomeController {
  List<RequestModel> data = [
    RequestModel(liters: 4, gift: "5l,14kg", date: "Mon,Oct 24"),
    RequestModel(liters: 14, gift: "2l,25kg", date: "Mon,Oct 24"),
    RequestModel(liters: 7, gift: "3l,25kg", date: "Mon,Oct 24"),
    RequestModel(liters: 7, gift: "3l,25kg", date: "Mon,Oct 24"),
    RequestModel(liters: 7, gift: "3l,25kg", date: "Mon,Oct 24"),
    RequestModel(liters: 7, gift: "3l,25kg", date: "Mon,Oct 24"),
  ];
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
