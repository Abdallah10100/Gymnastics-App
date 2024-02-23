import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                LoadingAnimationWidget.fourRotatingDots(
                    color: Theme.of(context).primaryColor, size: 35),
                const SizedBox(
                  width: 12,
                ),
                Text(message)
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {required QuickAlertType quickAlertType,
      String title = 'Title',
      String posActionName = 'Okay',
      String negActionName = 'Cancel',
      bool isDismissible = true,
      VoidCallback? posAction}) {
    QuickAlert.show(
      barrierDismissible: isDismissible,
      title: title,
      context: context,
      type: quickAlertType,
      text: message,
      confirmBtnText: posActionName,
      onConfirmBtnTap: () {
        Navigator.pop(context);
        posAction?.call();
      },
      cancelBtnText: negActionName,
      onCancelBtnTap: () {
        Navigator.pop(context);
      },
      confirmBtnColor: Colors.blueAccent,
    );
  }
}
