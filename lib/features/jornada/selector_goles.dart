import 'package:flutter/material.dart';

class SelectorGoles extends StatelessWidget {
  final int valor;
  final ValueChanged<int> onChanged;

  const SelectorGoles({
    super.key,
    required this.valor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove, size: 20),
          tooltip: 'Restar gol',
          onPressed: valor > 0 ? () => onChanged(valor - 1) : null,
        ),
        Container(
          width: 36,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Text(
            '$valor',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add, size: 20),
          tooltip: 'Sumar gol',
          onPressed: () => onChanged(valor + 1),
        ),
      ],
    );
  }
}