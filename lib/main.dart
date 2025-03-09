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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  var inController = TextEditingController();

  var result ="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calc.'),
        ),
        body: Container(
          width: 300,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("BMI Calci", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),),

            SizedBox(height: 21,),

            TextField(
              controller: wtController,
              decoration: InputDecoration(
                label:  Text('enter weight in kgs'),
                prefixIcon: Icon(Icons.line_weight)
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 11),

            TextField(
              controller: ftController,
              decoration: InputDecoration(
                label:  Text('enter height in ft.'),
                prefixIcon: Icon(Icons.line_weight)
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 11),


            TextField(
              controller: inController,
              decoration: InputDecoration(
                label:  Text('enter height in ft.'),
                prefixIcon: Icon(Icons.line_weight)
              ),
              keyboardType: TextInputType.number,
            ),

            ElevatedButton(onPressed:(){
              var wt = wtController.text.toString();
              var ft = ftController.text.toString();
              var inch = inController.text.toString();

              if(wt!= "" && ft!= "" && inch!= ""){


                var iWt = int.parse(wt);
                var iFt = int.parse(ft);
                var iInch = int.parse(inch);

                var tInch = (iFt*12) + iInch;
                var tCm = tInch*2.54;
                var tM = tCm/100;

                var bmi = iWt/(tM*tM);

                setState(() {
                  result = "your bmi is : ${bmi.toStringAsFixed(2)}";
                });

                

              } else {
                setState((){
                  result = "fill everything";
                });

              }
            }, child: Text('calculate')),

            Text(result, style: TextStyle(
              fontSize: 19
            ),)


        ],)
        ));
  }
}
