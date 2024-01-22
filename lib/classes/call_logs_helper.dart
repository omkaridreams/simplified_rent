import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class CallLogsHelper{
 
 Future<Iterable<CallLogEntry>> getCalllogs() async{
  return await CallLog.get();
 }

  
 dynamic getAvater(CallLogEntry entry){
   return entry.name;
  }
  getTitle(CallLogEntry entry){
    if(entry.name == null){
      return Text(entry.name.toString());
    }
    if(entry.name!.isEmpty){
      return Text(entry.number.toString());
    }else{

      return Text(entry.name.toString());
    }
  }



}