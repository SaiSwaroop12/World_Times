import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Object? data;


  @override
  Widget build(BuildContext context) {
   data = data!=null ? data : ModalRoute.of(context)!.settings.arguments;

    print(data);

    String img =  (ModalRoute.of(context)!.settings.arguments as Map)['isDay'] ? 'day.png' : 'night.png';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('assets/$img'),
            fit: BoxFit.fill,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic res = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : res['time'],
                        'location': res['location'],
                        'flag' : res['flag'],
                        'isDay': res['isDay']
                      };
                    });
                    },
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300]
                  ),
                  label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),

                  )
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    (data as Map)['location'].toString(),
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                (data as Map)['time'].toString(),
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.grey[100],

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
