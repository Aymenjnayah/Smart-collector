import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRequestStepOneController extends GetxController {
  final selectedDateTime = "".obs;
  final TextEditingController  dateController = TextEditingController();

  void getDate() async {
    // Open calendar dialog to choose date
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null) return; // User cancelled selection

    // Open time picker dialog to choose time
    final pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime == null) return; // User cancelled selection

    // Set the selected date and time as the observable value
    final dateTime = DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
        pickedTime.hour, pickedTime.minute);
    final dateTimeString = dateTime.toString();
    dateController.value = TextEditingValue(text: dateTimeString);
    selectedDateTime.value = dateTimeString;
  }

}
