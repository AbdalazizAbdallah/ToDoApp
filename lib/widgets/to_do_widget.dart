import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyToDoWidget extends StatefulWidget {
  const MyToDoWidget({Key? key}) : super(key: key);

  @override
  State<MyToDoWidget> createState() => _MyToDoWidgetState();
}

class _MyToDoWidgetState extends State<MyToDoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      trailing: Container(
        height: double.infinity ,
        width: 100,
        color: Colors.amberAccent,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.star_border_rounded,size: 30,)),
            Container(
              height: 25,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset.zero,
                      blurRadius: 5,
                      spreadRadius: 0,
                    )
                  ]),
              child:
                  const CircleAvatar(radius: 20, backgroundColor: Color(0xFFFC5565)),
            ),
          ],
        ),
      ),
      title: const Text('Metting with client'),
      subtitle: const Text('Official'),
      leading: SizedBox(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('10:00'),
            RichText(
                text: const TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),
                    children: [
                  TextSpan(text: 'AM'),
                ]))
          ],
        ),
      ),
    );
  }
}
