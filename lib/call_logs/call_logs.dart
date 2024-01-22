import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:simplifiedrenting/classes/call_logs_helper.dart';

class CallLogs extends StatefulWidget {
  const CallLogs({super.key});

  @override
  State<CallLogs> createState() => _CallLogsState();
}

class _CallLogsState extends State<CallLogs> {
  AppLifecycleState? _notification;
  Future<Iterable<CallLogEntry>>? logs;
  CallLogsHelper callLogsHelper = CallLogsHelper();

  @override
  void initState() {
    super.initState();
    logs = callLogsHelper.getCalllogs();
  }

  // @override
  // void didChangeDependencies(AppLifecycleState state) {
  //   super.didChangeDependencies();

  //   if(AppLifecycleState.resumed == state){

  //     setState(() {
  //       logs = callLogsHelper.getCalllogs();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Logs '),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: logs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Iterable<CallLogEntry>? entriest = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: entriest!.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: callLogsHelper.getAvater(
                                          entriest.elementAt(index)) !=
                                      null
                                  ? Colors.green
                                  : Colors.redAccent,
                            ),
                            title: callLogsHelper
                                .getTitle(entriest.elementAt(index)),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
