import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class TopSellingChart extends StatelessWidget {
  const TopSellingChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.topSellingProduct,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            ...[
              _Bar(label: AppStrings.august, value: 40),
              _Bar(label: AppStrings.july, value: 80),
              _Bar(label: AppStrings.june, value: 50),
              _Bar(label: AppStrings.may, value: 35),
              _Bar(label: AppStrings.april, value: 70),
            ],
            const SizedBox(height: 10),
            // Numbers below the chart
            _ChartNumbers(),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final String label;
  final double value;
  const _Bar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final barHeight = width < 600 ? 10.0 : 14.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 32, child: Text(label, style: TextStyle(fontSize: 12, color: Colors.black54))),
          Expanded(
            child: Container(
              height: barHeight,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Numbers: 0, 5, 10, ..., 85
    final numbers = List.generate(18, (i) => i * 5);
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 8, top: 2),
      child: Row(
        children: numbers.map((n) => Expanded(
          child: Text(
            n.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.grey[400]),
          ),
        )).toList(),
      ),
    );
  }
} 