import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pulley_app/main.dart';
import 'package:pulley_app/screens/selected_screen.dart';

// ignore: must_be_immutable
class Choose extends StatefulWidget {
  Choose(this.list, {super.key});

  List<(String, Object)> list;

  @override
  State<Choose> createState() {
    return _Choose();
  }
}

class _Choose extends State<Choose> {
  //List<String> items = ["hello", "hi", "everyone"];
  final RefreshController _refreshcontroller =
      RefreshController(initialRefresh: false);
  void onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      widget.list = remoteStore.conveyors;
    });
    _refreshcontroller.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(seconds: 3));
    _refreshcontroller.loadComplete();
  }

  void _choosen(Object conveyorId) {
    remoteStore.setPulleyStatus(conveyorId);
    Timer(const Duration(seconds: 10), () {
      remoteStore.SetPulleysCondition();
    });
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (ctx) => const Selected()))
          .then((value) => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose System"),
      ),
      body: SmartRefresher(
        controller: _refreshcontroller,
        onLoading: onLoading,
        onRefresh: onRefresh,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        child: ListView.builder(
            itemCount: widget.list.length,
            //itemCount: items.length,
            itemBuilder: (context, index) {
              return Card();
              // ListTile(
              //   title: Text(widget.list[index].$1),
              //   trailing: TextButton(
              //     child: Text("Choose"),
              //     onPressed: () {
              //       _choosen(widget.list[index].$2);
              //     },
              //   ),
              // );
            }),
      ),
    );
  }
}
