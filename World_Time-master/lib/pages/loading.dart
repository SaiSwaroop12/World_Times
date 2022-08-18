import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime wt = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDay': wt.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(

        child: SpinKitCubeGrid(
          color: Colors.white,

          size: 50.0,
        ),
      ),
    );
  }
}
