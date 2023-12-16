import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pulley_app/main.dart';
import 'package:pulley_app/widgets/confirmation.dart';
import 'package:pulley_app/widgets/feedback.dart';

// ignore: must_be_immutable
class Remove extends StatefulWidget {
  Remove(this.conveyorList, {super.key});

  List<(String, Object)> conveyorList;

  @override
  State<StatefulWidget> createState() {
    return _Remove();
  }
}

class _Remove extends State<Remove> {
  //List<String> items = ["hello", "hi", "everyone"];
  final RefreshController _refreshcontroller =
      RefreshController(initialRefresh: false);
  void onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      widget.conveyorList = remoteStore.conveyors;
    });
    _refreshcontroller.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      widget.conveyorList = remoteStore.conveyors;
    });
    _refreshcontroller.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    List<(String, Object)> list = widget.conveyorList;

    void _dialoguebox(Object conveyorId) {
      remoteStore.removeConveyor(conveyorId);
      showDialog(
          context: context,
          builder: ((ctx) {
            return const FeedbackDialogue();
          }));
      Timer(const Duration(seconds: 15), () => remoteStore.setConveyors);
    }

    void confirmation(Object conveyorId) {
      remoteStore.setConveyorName(conveyorId);
      showDialog(
          context: context,
          builder: (ctx) => ConfirmationDialogue(conveyorId, _dialoguebox));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Remove System"),
        ),
        body: SmartRefresher(
            controller: _refreshcontroller,
            onLoading: onLoading,
            onRefresh: onRefresh,
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(list[index].$1, style: TextStyle(fontSize: 16)),
                    trailing: TextButton(
                      child: Text("Remove", style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        confirmation(list[index].$2);
                      },
                    ),
                  );
                })));
  }
}
