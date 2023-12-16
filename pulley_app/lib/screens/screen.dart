import 'package:pulley_app/main.dart';
import 'package:pulley_app/screens/choose_screen.dart';
import 'package:pulley_app/screens/remove_screen.dart';
import 'package:pulley_app/widgets/create.dart';

import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Screen();
  }
}

class _Screen extends State<Screen> {
  void _cretaesytsem() {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        //showDragHandle: true,
        context: context,
        builder: (ctx) {
          return create();
        });
  }

  void _removesystem() {
    final List<(String, Object)> list = remoteStore.conveyors;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Remove(list);
        },
      ),
    );
  }

  void _choosesystem() {
    final List<(String, Object)> list = remoteStore.conveyors;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Choose(list);
        },
      ),
    );
  }

  // void feedbackeer() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return FeedbackDialogue();
  //       },
  //     ),
  //   );
  // }
  // void feedbackeer() {
  //   setState(() {
  //     showDialog(context: context, builder: ((ctx) => FeedbackDialogue()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    remoteStore.setConveyors();
    //feedbackeer();
    // print("refresh");
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _choosesystem,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose Sytsem",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _cretaesytsem,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Sytsem",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _removesystem,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remove Sytsem",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}




// void settings(BuildContext ctxxxxx) {
//     Navigator.of(ctxxxxx).push(
//       MaterialPageRoute(
//         builder: (_) {
//           return (){};
//         },
//       ),
//     );
//   }

