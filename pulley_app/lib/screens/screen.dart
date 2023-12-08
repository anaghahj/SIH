import 'package:pulley_app/screens/remove_screen.dart';
import 'package:pulley_app/widgets/create.dart';

import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    void _cretaesytsem() {
      showModalBottomSheet(
          //isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (ctx) {
            return const create();
          });
    }
    void _removesystem() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return Remove();
      },
    ),
  );
}

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _cretaesytsem,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Column(
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
            SizedBox(height: 10),
            GestureDetector(
              onTap: _cretaesytsem,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Column(
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
            SizedBox(height: 10),
            GestureDetector(
              onTap: _removesystem,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Column(
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
      ),
    );
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

