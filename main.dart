import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String resultado = "";

  void _calcularMelhorOpcao() {
    double etanolPrice = double.tryParse(etanolController.text) ?? 0;
    double gasolinaPrice = double.tryParse(gasolinaController.text) ?? 0;

    double ratio = etanolPrice / gasolinaPrice;

    setState(() {
      if (ratio < 0.7) {
        resultado = "Abasteça com etanol (melhor custo-benefício)";
      } else {
        resultado = "Abasteça com gasolina (melhor custo-benefício)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Comparador de Combustíveis"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _foto(),
          _campo(etanolController, "Preço do Etanol"),
          _campo(gasolinaController, "Preço da Gasolina"),
          _button(),
          _resultado(),
        ],
      ),
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://storage.mlcdn.com/account_image/151805/NXl3VtIPlPV5lzdgtXqZ7JoTFm2yN59LGaApbgCM.jpg',
        height: 150,
        width: 150,
      ),
    );
  }

  _campo(TextEditingController controller, String labelText) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 25.0),
      controller: controller,
    );
  }

  _resultado() {
    return Text(
      resultado,
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      onPressed: _calcularMelhorOpcao,
      child: Text(
        "Calcular",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}