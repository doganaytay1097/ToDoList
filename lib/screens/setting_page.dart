import 'package:flutter/material.dart';
import 'package:getitdone/models/color_theme_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema Seçimi yapınız'),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatefulWidget {
  const SwitchCard({super.key});

  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  Text greenText = Text('Green',style: TextStyle(color: Colors.green),);
  Text redText = Text('Red',style: TextStyle(color: Colors.red),);




  @override
  Widget build(BuildContext context) {
    bool _value =Provider.of<ColorsThemeData>(context).isGreen;
    return Card(
      color: Colors.white,
      child: SwitchListTile(
        subtitle: _value ? greenText : redText,
        title: Text('Change Theme Color',style: TextStyle(color: Colors.black),),
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
          Provider.of<ColorsThemeData>(context,listen: false).switchTheme(value);
        },
      ),
    );
  }
}
