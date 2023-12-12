import 'package:flutter/material.dart';
import 'package:pulley_app/screens/selected_screen.dart';

// ignore: must_be_immutable
class Choose extends StatefulWidget{
  const Choose(this.list,{super.key});
  
  final List<(String,Object)> list;

  @override
  State<Choose> createState() {
    return _Choose();
  
}
}
class _Choose extends State<Choose> {
  //List<String> items = ["hello", "hi", "everyone"];
  
  void _choosen(Object conveyorId) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return const Selected();
          },
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose System"),
        // actions: [
        //   IconButton(onPressed: (){
        //     setState(){}
        //   }, icon: const Icon(Icons.replay_outlined))
        // ],
      ),
      body: ListView.builder(
          itemCount: widget.list.length,
          //itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.list[index].$1),
              trailing: TextButton(
                child: Text("Choose"),
                onPressed:(){_choosen(widget.list[index].$2);} ,
              ),
            );
          }),
    );
  }
}
