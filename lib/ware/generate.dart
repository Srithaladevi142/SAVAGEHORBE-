import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class GenerateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GenerateScreenState();
}

Widget imageCarousels = Container(
  height: 170,
  child: Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('images/images1.jpg'),
      AssetImage('images/images2.jpg'),
      AssetImage('images/images3.jpg'),
    ],
    dotSize: 4.0,
    dotSpacing: 15.0,
    dotColor: Colors.pink[500],
    indicatorBgPadding: 5.0,
    autoplay: true,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 3000),
  ),
);

class GenerateScreenState extends State<GenerateScreen> {
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  String uName = '';
  String pNumber = '';
  String address = '';
  String indate = '';
  String outdate = '';
  String total = '';
  String avail = '';
  String rent = '';
  String rentt = '';
  String minVal = '';
  String maxVal = '';

  GlobalKey globalKey = new GlobalKey();
  String _dataString = "Hello from this QR";
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('QR Code Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _captureAndSharePng,
          )
        ],
      ),
      backgroundColor: Colors.cyan,
      body: _contentWidget(),
    );
  }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      final channel = const MethodChannel('channel:me.alfian.share/share');
      channel.invokeMethod('shareFile', 'image.png');
    } catch (e) {
      print(e.toString());
    }
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    var qrImage = QrImage(
      data: _dataString,
      size: 0.2 * bodyHeight,

      // onError: (ex) {
      //   print("[QR] ERROR - $ex");
      //   setState((){
      //     _inputErrorText = "Error! Maybe your input value is too long?";
      //   });
      // },
    );
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          imageCarousels,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: _topSectionTopPadding,
                left: 20.0,
                right: 10.0,
                bottom: _topSectionBottomPadding,
              ),
              child: Container(
                height: _topSectionHeight,
                child: ListView(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( right: 270),
                        child: Text(
                          'USER NAME:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            uName = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 230),
                        child: Text(
                          'PHONE NUMBER:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            pNumber = val;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 270),
                        child: Text(
                          'ADDRESS:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            address = val;
                          },
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 40, right: 230),
                        child: Text(
                          'INDATE(with time):',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            indate= val;
                          },
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 40, right: 200),
                        child: Text(
                          'OUTDATE (with time):',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            outdate = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 220),
                        child: Text(
                          'TOTAL CAPACITY:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            total = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 200),
                        child: Text(
                          'AVAILABLE CAPACITY:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            avail = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 200),
                        child: Text(
                          'RENT AS PER WEIGHT:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            rent = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 220),
                        child: Text(
                          'RENT AS PER TIME:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            rentt = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'COLD STORAGE TEMPERATURE',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 150),
                        child: Text(
                          'MINIMUM TEMPRATURE (deg cel):',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            minVal = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 140),
                        child: Text(
                          'MAXIMUM TEMPERATURE (deg cel):',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 120),
                        child: TextFormField(
                          decoration: InputDecoration(),
                          onChanged: (val) {
                            maxVal = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: FlatButton(
                          child: Text("SUBMIT"),
                          onPressed: () {
                            setState(() {
                              _dataString =
                                  "$uName \n $pNumber \n $address \n  $indate \n  $indate \n $outdate \n$total \n $avail \n $rent  \n $rentt \n $minVal \n $maxVal";
                              _inputErrorText = null;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: RepaintBoundary(
                          key: globalKey,
                          child: qrImage,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
