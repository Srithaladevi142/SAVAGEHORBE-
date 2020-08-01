import 'package:flutter/material.dart';

import 'erode.dart';

class CropSuggestion extends StatefulWidget {
  @override
  _CropSuggestionState createState() => _CropSuggestionState();
}

class _CropSuggestionState extends State<CropSuggestion> {
  var _district = [
    'Erode',
    'Ariyalur ',
    'Karur',
    'Nagappattinam',
    'Perambalur',
    'Pudukkottai',
    'Thanjavur',
    'Tiruchirappalli',
    'Tiruvarur',
    'Dharmapuri',
    'Coimbatore',
    'Krishnagiri',
    'Namakkal',
    'The Nilgiris',
    'Salem',
    'Tiruppur',
    'Dindigul',
    'Kanyakumari',
    'Madurai',
    'Ramanathapuram',
    'Sivagangai',
    'Theni',
    'Thoothukudi',
    'Tirunelveli',
    'Virudhunagar',
    'Tenkasi',
    'Chennai',
    'Cuddalore',
    'Kanchipuram',
    'Chengalpattu',
    'Tiruvallur',
    'Tiruvannamalai',
    'Vellore',
    'Viluppuram',
    'Kallakurichi',
    'Ranipet',
    'Thirupattur',
  ];

  String _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Suggestion'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: InputDecorator(
                    decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        labelText: 'Please select District ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    isEmpty: _currentSelectedValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: _district.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Erode();
                    },
                  ));
                },
                child: Text('SUBMIT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
