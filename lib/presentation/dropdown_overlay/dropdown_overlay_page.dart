import 'package:flutter/material.dart';

class DropdownOverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DropdownButton<String>(
        items: [
          '5KM',
          '10KM',
          '21.0975KM',
          '42.195KM',
          '50KM',
          '80KM',
          '100KM',
          '200KM'
        ].map((e) => DropdownMenuItem<String>(child: Text('$e'))).toList(),
        onChanged: (value) {},
      ),
    );
  }
}
