import 'package:flutter/material.dart';

class HourInput extends StatefulWidget {
  const HourInput({super.key, required this.hour,required this.onChanged});
final int hour;
final void Function(int?) onChanged;
  @override
  State<HourInput> createState() => _HourInputState();
}

class _HourInputState extends State<HourInput> {
  int _hour = 0;
  List<int> list = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
                value: _hour,
                hint: Text("Hour"),
                  items: list.map<DropdownMenuItem<int>>((value) {
                    return DropdownMenuItem<int>(
                        value: value, child: Text(value.toString()));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _hour = val!;
                    });
                    widget.onChanged(val);
                  });
  }
}