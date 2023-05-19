import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberPicker extends StatelessWidget {
  final int value;
  final void Function(int) onDecrease;
  final void Function(int) onIncrease;

  const NumberPicker({
    Key? key,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(Icons.remove, onDecrease, false),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
        _buildButton(Icons.add, onIncrease, true),
      ],
    );
  }

  Widget _buildButton(IconData icon, void Function(int) onPressed, bool isPlusButton) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFF2F2F2),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isPlusButton ? Colors.green : Color(0xFFFFB109),
        ),
        onPressed: () => onPressed(value),
      ),
    );
  }
}
