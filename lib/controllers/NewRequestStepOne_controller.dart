import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Request.dart';
import '../routes/app_routes.dart';

class NewRequestStepOneController extends GetxController {
  final selectedDateTime = ''.obs;
  final address = ''.obs;
  final amount = 0.obs;
  final TextEditingController dateController = TextEditingController();

  void getDate() async {
    // Ouvrir le dialogue du calendrier pour choisir la date
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null) return; // L'utilisateur a annulé la sélection

    // Ouvrir le dialogue du sélecteur de temps pour choisir l'heure
    final pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime == null) return; // L'utilisateur a annulé la sélection

    // Définir la date et l'heure sélectionnées comme valeur observable
    final dateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );
    final dateTimeString = dateTime.toString();
    dateController.value = TextEditingValue(text: dateTimeString);
    selectedDateTime.value = dateTimeString;
  }

  void goToNextStep() {
    if (amount.value <= 0) {
      Get.snackbar('Erreur', 'Le montant doit être supérieur à zéro.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (address.value.isEmpty) {
      Get.snackbar('Erreur', 'Veuillez entrer une adresse.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (selectedDateTime.value.isEmpty) {
      Get.snackbar('Erreur', 'Veuillez sélectionner une date.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    final request = Request(
      amount: amount.value,
      address: address.value,
      date: DateTime.parse(selectedDateTime.value),
    );

    // Passage de l'objet Request à l'écran suivant
    Get.toNamed(AppRoutes.NewRequest2, arguments: request);
  }

  void increaseAmount() {
    amount.value = amount.value + 1;
  }

  void decreaseAmount() {
    if (amount.value != 0) {
      amount.value = amount.value - 1;
    }
  }

  void addAddress() async {
    final textController = TextEditingController();
    await showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter une adresse'),
          content: TextField(
            controller: textController,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  address.value = textController.text;
                  Get.back();
                }
              },
              child: Text('Valider'),
            ),
          ],
        );
      },
    );
  }
}
