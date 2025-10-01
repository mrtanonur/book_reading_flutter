import 'dart:io';

import 'package:book_reading_flutter/utils/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future brAlertDialog(
    {required BuildContext context,
    required String title,
    required String description,
    String? confirmText,
    void Function()? confirmOnPressed,
    bool isDestructive = false}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      if (Platform.isAndroid) {
        return AlertDialog(
          backgroundColor: ColorConstants.white,
          title: Text(title),
          content: Text(description),
          actions: [
            if (isDestructive)
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel",
                      style: TextStyle(color: ColorConstants.blue))),
            TextButton(
                onPressed: confirmOnPressed ?? () => Navigator.pop(context),
                child: Text(confirmText ?? "OK",
                    style: TextStyle(
                        color: isDestructive
                            ? ColorConstants.red
                            : ColorConstants.blue))),
          ],
        );
      } else {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            if (isDestructive)
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: ColorConstants.blue),
                  )),
            CupertinoDialogAction(
                onPressed: confirmOnPressed ?? () => Navigator.pop(context),
                child: Text(confirmText ?? "OK",
                    style: TextStyle(
                        color: isDestructive
                            ? ColorConstants.red
                            : ColorConstants.blue))),
          ],
        );
      }
    },
  );
}
