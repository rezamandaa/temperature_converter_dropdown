import 'package:flutter/material.dart';
import 'package:temperature_converter_dropdown/widgets/InputSuhu.dart';
import 'package:temperature_converter_dropdown/widgets/KonversiSuhu.dart';
import 'package:temperature_converter_dropdown/widgets/PerhitunganTerakhir.dart';
import 'package:temperature_converter_dropdown/widgets/RiwayatPerhitungan.dart';
import 'package:temperature_converter_dropdown/widgets/TargetPerhitungan.dart';

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
      home: const MyHomePage(title: 'Konverter Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropdown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case "Kelvin":
            hasilPerhitungan = double.parse(etInput.text) + 273.15;
            break;
          case "Reamur":
            hasilPerhitungan = double.parse(etInput.text) * 4 / 5;
            break;
          case "Fahrenheit":
            hasilPerhitungan = (double.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectedDropdown +
            " Dengan hasil " +
            hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            InputSuhu(
              etInput: etInput,
              onPressed: konversiSuhu,
            ),
            const SizedBox(
              height: 8,
            ),

            
            TargetPerhitungan(
              selectedDropdown: selectedDropdown,
              listSatuanSuhu: listSatuanSuhu,
              onDropdownChanged: onDropdownChanged,
              onPressed: konversiSuhu,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Hasil",
              style: TextStyle(fontSize: 18),
            ),
            PerhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
            const SizedBox(
              height: 10,
            ),
            KonversiSuhu(
              onPressed: konversiSuhu,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
            RiwayatPerhitungan(listHasil: listHasil)
          ],
        ),
      ),
    );
  }
}