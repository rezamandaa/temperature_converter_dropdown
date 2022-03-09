import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputSuhu extends StatelessWidget {
  const InputSuhu({
    Key? key,
    required this.etInput,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController etInput;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: etInput,
      decoration: const InputDecoration(
          labelText: 'Celcius', hintText: 'Enter the temperature in celcius'),
      onChanged: (value) {
        onPressed();
      },
    );
  }
}