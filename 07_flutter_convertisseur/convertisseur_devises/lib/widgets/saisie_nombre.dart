import 'package:convertisseur_devises/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaisieNombre extends StatelessWidget {
  Function onChanged;
  SaisieNombre(this.onChanged);

  @override
  Widget build(BuildContext context) {
    return TextField(style: AppStyle.inputStyle, onChanged: this.onChanged);
  }
}
