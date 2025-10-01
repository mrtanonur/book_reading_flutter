import 'dart:io';

import 'package:book_reading_flutter/utils/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BRDropdownMenu extends StatefulWidget {
  final String valueMaterial;
  final int valueCupertino;
  final List<String> dropdownList;
  final void Function(String?) dropdownValueSetMaterial;
  final void Function(int?) dropdownValueSetCupertino;
  const BRDropdownMenu(
      {super.key,
      required this.valueMaterial,
      required this.dropdownList,
      required this.dropdownValueSetMaterial,
      required this.valueCupertino,
      required this.dropdownValueSetCupertino});

  @override
  State<BRDropdownMenu> createState() => _BRDropdownMenuState();
}

class _BRDropdownMenuState extends State<BRDropdownMenu> {
  void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(top: false, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return DropdownButton(
          value: widget.valueMaterial,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: ColorConstants.accent),
          items:
              widget.dropdownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: widget.dropdownValueSetMaterial);
    } else {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        // Display a CupertinoPicker with list of fruits.
        onPressed: () => showDialog(
          CupertinoPicker(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: 24.0, // height of all children
              onSelectedItemChanged: widget.dropdownValueSetCupertino,
              scrollController: FixedExtentScrollController(
                  initialItem: widget.valueCupertino),
              children: List<Widget>.generate(widget.dropdownList.length,
                  (int index) {
                return Center(child: Text(widget.dropdownList[index]));
              })),
          // This displays the selected fruit name.
        ),
        child: Text(widget.dropdownList[widget.valueCupertino],
            style: const TextStyle(fontSize: 22.0)),
      );
    }
  }
}
