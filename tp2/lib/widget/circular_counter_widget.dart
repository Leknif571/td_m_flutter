import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularCounter extends StatelessWidget {
  const CircularCounter({super.key, required this.imc});

  final double imc;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 45, ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0,
            endValue: 18,
            color: Colors.green,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 18,
            endValue: 25,
            color: Colors.yellow,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 25,
            endValue: 35,
            color: Colors.orange,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 35,
            endValue: 45,
            color: Colors.red,
            startWidth: 10,
            endWidth: 10)
      ], pointers: <GaugePointer>[
        NeedlePointer(value: imc)
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Text(imc.toStringAsFixed(1),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }
}
