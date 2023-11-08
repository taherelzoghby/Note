import 'package:flutter/material.dart';
import 'package:note_3/core/consts/style.dart';

import '../../generated/l10n.dart';

class AlertDialogWidget extends StatelessWidget {
  final String contentText;
  final Function confirmFunction;
  final Function declineFunction;

  const AlertDialogWidget({
    required this.contentText,
    required this.confirmFunction,
    required this.declineFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(contentText),
      actions: [
        TextButton(
          onPressed: () => declineFunction(),
          child: Text(
            S.of(context).no,
            style: const TextStyle(color: AppConsts.red),
          ),
        ),
        TextButton(
          onPressed: () => confirmFunction(),
          child: Text(S.of(context).yes),
        ),
      ],
    );
  }
}
