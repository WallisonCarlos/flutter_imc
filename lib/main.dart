import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String info = "Informe seus dados!";
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();

  void _resetFields() {
    weight.text = "";
    height.text = "";
    info = "Informe seus dados!";
  }

  void calculate() {
    setState(() {

      double weight = double.parse(this.weight.text);
      double height = double.parse(this.height.text);

      double imc = weight / (height * height);

      if (imc < 18.0) {
        info = "Desnutrido: \n${imc.toStringAsPrecision(3)}";
      } else if (18.0 <= imc && imc < 24.9) {
        info = "Em forma: \n${imc.toStringAsPrecision(3)}";
      } else if (24.9 <= imc && imc < 29.9) {
        info = "Começando a ganhar uns culotes: \n${imc.toStringAsPrecision(3)}";
      } else if (29.9 <= imc && imc < 34.9) {
        info = "O buxo tá crescendo: \n${imc.toStringAsPrecision(3)}";
      } else if (34.9 <= imc && imc < 39.9) {
        info = "Tá com quantos meses?: \n${imc.toStringAsPrecision(3)}";
      } else if (39.9 <= imc && imc < 60.0) {
        info = "Eita porra do caraí: \n${imc.toStringAsPrecision(3)}";
      } else if (60.0 <= imc) {
        info = "Tá quente aí no inferno, porque tu tá morto desgraça: \n${imc.toStringAsPrecision(3)}";
      }

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 128.0,
              color: Colors.green,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso em (kg)",
                  labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize:  25.0
              ),
              controller: weight,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altuma em (cm)",
                  labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize:  25.0
              ),
              controller: height,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    calculate();
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0
                    ),
                  ),
                  color: Colors.green,
                ),
              ),
            ),
            Text(
              info,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0
              ),
            )
          ],
        ),
      ),
    );
  }
}
