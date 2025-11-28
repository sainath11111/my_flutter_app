import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController(); // controllers for textfields
var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(
        color: Colors.pink,
        child: 
      
      Center(
         child:
       Container(
        color: Colors.grey[300],
        
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          const Text(
            'BMI',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: wtController,
            decoration: const InputDecoration(
              labelText: 'weight in kg',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.line_weight),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
           TextField(
            controller: ftController,
            decoration: const InputDecoration(
              labelText: 'feet',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.square_foot),
            ),
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 20),
           TextField(
              
            controller: inController,
            decoration: const InputDecoration(
              labelText: 'inches',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.insert_chart_outlined),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              var wt = wtController.text.toString();
              var ft = ftController.text.toString();
              var inch = inController.text.toString();
              if(wt != "" && ft != "" && inch != "") {
               var iwt =int.parse(wt);
               var ift = int.parse(ft);
               var iinch = int.parse(inch);

               var totalInch = (ift * 12) + iinch;
               var totalCm = totalInch * 2.54;
                var totalM = totalCm / 100;
                var bmi = iwt / (totalM * totalM);
                setState(() {
                  result ="your bmi is ${bmi.toStringAsFixed(2)}";
                });
                // Validations
              }
              else{
                setState(() {
                  result = "please fill all textfieald";
                });
          
              }
              // Button press action
            },
            child: const Text('Calculate BMI',style: TextStyle(fontSize: 18),),
          ),
          const SizedBox(height: 20),
          Text(
            'Your BMI is:$result ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),),),
    ),); // <-- missing semicolon added
  }
}
