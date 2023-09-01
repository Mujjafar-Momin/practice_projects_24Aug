package com.example.practice_demo_projects

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterEngineConfigurator
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val channel="channelDemo";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channel).setMethodCallHandler { call, result ->
           var args= call.arguments as Map<String,String>
            var title=args["title"]
            var desc=args["desc"]

           if(call.method=="showToast"){
               Toast.makeText(context,title,Toast.LENGTH_SHORT).show()
               Toast.makeText(context,desc,Toast.LENGTH_LONG).show()
           }
        }
    }

}
