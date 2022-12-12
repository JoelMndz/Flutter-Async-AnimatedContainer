import 'package:flutter/material.dart';
import 'package:practica_rest/services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool selectFerrari = false;
  bool selectHyndai = false;
  bool selectFisher = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async/Await'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ferrari()
          ),
          Expanded(
            flex: 1,
            child: hyundai()
          ),
          Expanded(
            flex: 1,
            child: fisherPrice()
          )
        ],
      ),
    );
  }

  Widget ferrari(){
    return GestureDetector(
      onTap: () async{
        setState(() {
          selectFerrari = !selectFerrari;
        });
        int numero = await MockApi().getFerrariInteger();
        print('Resultado del ferrary: $numero');
      },
      child: Center(
        child: AnimatedContainer(
          width: selectFerrari ? 200.0 : 100.0,
          height: selectFerrari ? 100.0 : 200.0,
          color: selectFerrari ? Colors.amber : Colors.amberAccent,
          alignment:
              selectFerrari ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Text('Llamar ferrari'),
        ),
      ),
    );
  }

  Widget hyundai(){
    return GestureDetector(
      onTap: () async{
        setState(() {
          selectHyndai = !selectHyndai;
        });
        int numero = await MockApi().getHyundaiInteger();
        print('Resultado del hyndai: $numero');
      },
      child: Center(
        child: AnimatedContainer(
          width: selectHyndai ? 200.0 : 100.0,
          height: selectHyndai ? 100.0 : 200.0,
          color: selectHyndai ? Colors.green : Colors.greenAccent,
          alignment:
              selectHyndai ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 3),
          curve: Curves.fastOutSlowIn,
          child: Text('Llamar hyundai',
            style: TextStyle(
              color: selectHyndai ? Colors.white : Colors.black
            ),  
          ),
        ),
      ),
    );
  }

  Widget fisherPrice(){
    return GestureDetector(
      onTap: () async{
        setState(() {
          selectFisher = !selectFisher;
        });
        int numero = await MockApi().getFisherPriceInteger();
        print('Resultado del ficher price: $numero');
      },
      child: Center(
        child: AnimatedContainer(
          width: selectFisher ? 200.0 : 100.0,
          height: selectFisher ? 100.0 : 200.0,
          color: selectFisher ? Colors.blue : Colors.blueAccent,
          alignment:
              selectFisher ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 10),
          curve: Curves.fastOutSlowIn,
          child: Text('Fisher Price',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

