
import 'dart:async';
import 'package:flutter/material.dart';

class StreamControllerWidget extends StatefulWidget {
  const StreamControllerWidget({super.key, required this.title});
  final String title;

  @override
  State<StreamControllerWidget> createState() => _StreamControllerWidgetState();
}

class _StreamControllerWidgetState extends State<StreamControllerWidget> {

StreamController<String> streamController =StreamController<String>();
late Stream<String> dataStream;
  TextEditingController textController =TextEditingController();
 
 @override
  void initState() {
    // TODO: implement initState
    dataStream=streamController.stream.asBroadcastStream();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             StreamBuilder(
              stream: dataStream,
               builder: (context,snapshot) {
                 return Text(
                  snapshot.data??'No Data',
            );
               }
             ),
              const SizedBox(
              height: 20,
            ),
             StreamBuilder(
              stream: dataStream,
               builder: (context,snapshot) {
                 return Text(
                  snapshot.data??'No data',
            );
               }
             ),
           const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "Enter Some Text",
                  labelText: "Input Text"
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              streamController.add(textController.text);
            }, child:const Text("done"))
          ],
        ),
      ),
    );
  }
}
