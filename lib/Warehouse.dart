import 'package:flutter/material.dart';
import 'package:greeny_go/guestpage.dart';

class WareHouse extends StatefulWidget {
  @override
  _WareHouseState createState() => _WareHouseState();
}

class _WareHouseState extends State<WareHouse> {
  var _state = [
    "Tamil Nadu",
    "Karnataka",
    "Kerala",
    "Maharastra",
  ];
  var _district = [
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
    'Erode',
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
  String textStyle;
  String _currentSelectedValue;
  String _districtSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WARE HOUSE'),
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
                        labelText: 'Please select State ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    isEmpty: _districtSelectedValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _districtSelectedValue,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _districtSelectedValue = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: _state.map((String value) {
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
                child: Text('SUBMIT'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailPage();
                  }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
