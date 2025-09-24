import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BRSwitch extends StatefulWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const BRSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<BRSwitch> createState() => _BRSwitchState();
}

class _BRSwitchState extends State<BRSwitch> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Switch(
        value: widget.value,
        onChanged: widget.onChanged,
      );
    } else {
      return CupertinoSwitch(
        value: widget.value,
        onChanged: widget.onChanged,
      );
    }
  }
}
