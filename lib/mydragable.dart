import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Mydrag extends StatefulWidget {
  const Mydrag({super.key, required String title});

  @override
  State<Mydrag> createState() => _MydragState();
}

class _MydragState extends State<Mydrag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Draggable(
          data: Colors.orange,

          child: Container(
            width: 150,
            height: 160,
            color: Colors.orange,
            child: Center(
              child: Text("hi,",style: TextStyle(
                fontSize: 18
              ),),
            ),
          ),
onDraggableCanceled:(velocity,offset){},
          feedback: Container(
           width: 150,
            height: 150,
            color: Colors.orange.withOpacity(0.5),
            child: Text("hai.....",style: TextStyle(fontSize: 18,color: Colors.white),),
          )),
    );
  }
}
