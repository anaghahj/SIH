import 'package:flutter/material.dart';

class ConfirmationDialogue extends StatelessWidget {
  ConfirmationDialogue(this.conveyorId, this._dialoguebox, {super.key});
  final Object conveyorId;
  final void Function(Object) _dialoguebox;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("are you sure you want to remove the system"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            _dialoguebox(conveyorId);
          },
          child: Text("Submit"),
        ),
      ],
    );
  }
}
