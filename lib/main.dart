import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pa=new TextEditingController();
  TextEditingController ty=new TextEditingController();
  TextEditingController ir=new TextEditingController();
  String r='0';
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  padding: EdgeInsets.all(20),
                  child: Text("Simple Interest=$r",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller:pa ,
                  decoration: InputDecoration(
                    labelText: "Principle",
                    hintText: "Enter principle",
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                      return "Cant be empty.";
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller:ty ,
                  decoration: InputDecoration(
                    labelText: "Time(year)",
                    hintText: "Enter time",
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                      return "Cant be empty.";
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller:ir ,
                  decoration: InputDecoration(
                    labelText: "Interest(%)",
                    hintText: "Enter rate of interst",
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                      return "Cant be empty.";
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: RaisedButton(
                    textColor: Colors.white,
                      color: Colors.orange,
                      child: Text("Calculate"),
                      onPressed:calculate),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void calculate()
  {if(_formKey.currentState!.validate())
    {
    double p=double.parse(pa.text.toString());
    double i=double.parse(ir.text.toString());
    double t=double.parse(ty.text.toString());
    double si=(p*i*t)/100.0;
    setState(() {
      r=si.toString();
    });
  }
}
}

