import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelDemo extends StatefulWidget {
  const MethodChannelDemo({super.key});

  @override
  State<MethodChannelDemo> createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {

  var channel=const MethodChannel("channelDemo");

  showToast(){
    channel.invokeMethod("showToast",{
      'title':'Hey Mujjafar..!',
      'desc':"Good Morning"
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Method Channel Demo"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: showToast,
        child: const Text("Click Toast"),
      )),
    );
  }
}
