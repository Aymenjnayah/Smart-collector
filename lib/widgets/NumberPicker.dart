import 'package:flutter/material.dart';

class NumberPicker extends StatelessWidget {
  final int value;
  final void Function(int) onChanged;

  const NumberPicker({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(Icons.remove, () => onChanged(value - 1), false),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
        _buildButton(Icons.add, () => onChanged(value + 1), true),
      ],
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed, bool isPlusButton) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFF2F2F2),
      ),
      child: IconButton(
        icon: Icon(icon, color: isPlusButton ? Colors.green : Color(0xFFFFB109)),
        onPressed: onPressed,
      ),
    );
  }
}
