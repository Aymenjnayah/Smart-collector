import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/models/Gift.dart';

import '../config/app_styles.dart';
import 'NumberPicker.dart';

class GiftItem extends StatelessWidget {
  final Gift item;
  final bool showNumberPicker;
  final void Function(int) onDecrease;
  final void Function(int) onIncrease;

  const GiftItem({
    Key? key,
    required this.item,
    this.showNumberPicker = true,
    required this.onDecrease,
    required this.onIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(item.imageUrl),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  item.title,
                  style: AppStyles.neutralBlack18W7Style,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/images/money_icon.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${item.price}',
                      style: AppStyles.green16W8Style,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  item.quantity.toString(),
                  style: AppStyles.neutralBlack14W4Style,
                ),
                SizedBox(
                  height: 12,
                ),
                showNumberPicker
                    ? NumberPicker(
                  value: item.selectedCount??0,
                  onDecrease: onDecrease,
                  onIncrease: onIncrease,
                )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
