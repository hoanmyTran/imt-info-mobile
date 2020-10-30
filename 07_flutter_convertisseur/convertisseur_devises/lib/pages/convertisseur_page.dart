import 'package:convertisseur_devises/models/devise.dart';
import 'package:convertisseur_devises/styles.dart';
import 'package:convertisseur_devises/widgets/liste_devises.dart';
import 'package:convertisseur_devises/widgets/saisie_nombre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConvertisseurDevisePage extends StatefulWidget {
  ConvertisseurDevisePage();
  @override
  State<StatefulWidget> createState() {
    return _ConvertisseurDevisePage();
  }
}

class _ConvertisseurDevisePage extends State<ConvertisseurDevisePage> {
  // les différents "états" de la page
  double _valeur; // valeur saisie
  Devise _deviseInitial; // devise initiale sélectionnée
  Devise _deviseFinale; // devise finale sélectionnée
  double _resultat; // le résultat de la conversion
  // définition des valeurs initiales

  @override
  void initState() {
    super.initState();
    _valeur = 0;
    _resultat = 0;
    _deviseInitial = Devise.EURO;
    _deviseFinale = Devise.DOLLAR;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Spacer(),
        Text(
          'Valeur',
          style: AppStyle.labelStyle,
        ),
        Spacer(),
        SaisieNombre((saisie) {
          var valeurSaisie = double.parse(saisie);
          setState(() {
            _valeur = valeurSaisie;
          });
        }),
        Spacer(),
        Text(
          'De',
          style: AppStyle.labelStyle,
        ),
        Spacer(),
        ListeDevises((newVal) {
          setState(
            () {
              _deviseInitial = newVal;
            },
          );
        }, _deviseInitial),
        Spacer(),
        Text('Vers', style: AppStyle.labelStyle),
        Spacer(),
        ListeDevises((newVal) {
          setState(
            () {
              _deviseFinale = newVal;
            },
          );
        }, _deviseFinale),
        Spacer(
          flex: 2,
        ),
        ElevatedButton(
          onPressed: () => {
            setState(() {
              _resultat = _valeur * taux[_deviseFinale];
            })
          },
          child: Text('Convertir'),
        ),
        Spacer(
          flex: 2,
        ),
        Text(_resultat.toString(), style: AppStyle.labelStyle),
        Spacer(),
      ],
    ));
  }
}
