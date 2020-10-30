import 'package:convertisseur_devises/models/devise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListeDevises extends StatelessWidget {
  Function onChanged;
  Devise devise;
  ListeDevises(this.onChanged, this.devise);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        onChanged: this.onChanged,
        value: this.devise,
        items: [
          DropdownMenuItem<Devise>(
            value: Devise.DOLLAR,
            child: Text(libelles[Devise.DOLLAR]),
          ),
          DropdownMenuItem<Devise>(
            value: Devise.EURO,
            child: Text(libelles[Devise.EURO]),
          ),
          DropdownMenuItem<Devise>(
            value: Devise.LIVRE_STERLING,
            child: Text(libelles[Devise.LIVRE_STERLING]),
          ),
        ]);
  }
}
