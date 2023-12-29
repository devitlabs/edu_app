import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultatSimulateurBEPC extends StatefulWidget {
  final double moBEPC;
  const ResultatSimulateurBEPC({super.key, required this.moBEPC});

  @override
  State<ResultatSimulateurBEPC> createState() => _ResultatSimulateurBEPCState();
}

class _ResultatSimulateurBEPCState extends State<ResultatSimulateurBEPC> {

  bool isWebFullView = false;
  bool isCardView = false;

  @override
  Widget build(BuildContext context) {
    return _buildTemperatureMonitorExample();
  }

  /// Returns the gauge temperature monitor
  SfRadialGauge _buildTemperatureMonitorExample() {
    return SfRadialGauge(
      animationDuration: 5000,
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            minimum: 0,
            maximum: 20,
            interval: 2,
            minorTicksPerInterval: 9,
            showAxisLine: false,
            radiusFactor: 0.9,
            labelOffset: 8,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 14,
                  endValue: 20,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(34, 144, 199, 0.75)),
              GaugeRange(
                  startValue: 12,
                  endValue: 14,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(34, 195, 199, 0.75)),
              GaugeRange(
                  startValue: 10,
                  endValue: 12,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(123, 199, 34, 0.75)),
              GaugeRange(
                  startValue: 8,
                  endValue: 10,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 193, 34, 0.75)),
              GaugeRange(
                  startValue: 0,
                  endValue: 8,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 79, 34, 0.65)),
            ],
            annotations: <GaugeAnnotation>[
              const GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.35,
                  widget: Text('MO BEPC',
                      style:
                      TextStyle(color: Colors.black, fontSize: 16))),
              GaugeAnnotation(
                angle: 90,
                positionFactor: 0.8,
                widget: Text(
                  '  ${widget.moBEPC}  ',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 20),
                ),
              )
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: widget.moBEPC,
                needleStartWidth: isCardView ? 0 : 1,
                needleEndWidth: isCardView ? 5 : 8,
                animationType: AnimationType.easeOutBack,
                enableAnimation: true,
                animationDuration: 1200,
                knobStyle: KnobStyle(
                    knobRadius: isCardView ? 0.06 : 0.09,
                    borderColor: primaryColor,
                    color: Colors.white,
                    borderWidth: isCardView ? 0.035 : 0.05),
                tailStyle: TailStyle(
                    color: primaryColor,
                    width: isCardView ? 4 : 8,
                    length: isCardView ? 0.15 : 0.2),
                needleColor: primaryColor,
              )
            ],
            axisLabelStyle: GaugeTextStyle(fontSize: isCardView ? 10 : 12),
            majorTickStyle: const MajorTickStyle(
                length: 0.25, lengthUnit: GaugeSizeUnit.factor),
            minorTickStyle: const MinorTickStyle(
                length: 0.13, lengthUnit: GaugeSizeUnit.factor, thickness: 1))
      ],
    );
  }
}
