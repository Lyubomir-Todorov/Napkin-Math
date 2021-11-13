import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Napkin Math',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _buyPrice;
  double _sellPrice;
  int _quantity;

  double _pricePerUnit;
  double _percentage;
  double _total;

  var _controllerBuy = TextEditingController();
  var _controllerSell = TextEditingController();
  var _controllerQty = TextEditingController();

  calculateValues() {
    setState(() {
      _pricePerUnit = (_sellPrice - _buyPrice) ?? 0;
      _percentage = (( (_pricePerUnit ?? 0) / (_buyPrice ?? 1)) * 100) ?? 0;
      _total = ((_sellPrice ?? 0) - (_buyPrice ?? 0)) * (_quantity ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.green[50],
              ],
            )
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.0),
                  Text(
                    'Napkin Math',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 48,
                    ),
                  ),

                  Text(
                    'Made by Lyubomir Todorov',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controllerBuy,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Buy Price',
                            prefix: Text('\$ '),
                          ),
                          onChanged: (val) {
                            var _temp;
                            _temp = (val == '') ? 0.0 : double.parse(val);
                            setState(() {
                              _buyPrice = _temp;
                            });
                            calculateValues();
                          },
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: TextField(
                          controller: _controllerSell,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Sell Price',
                            prefix: Text('\$ '),
                          ),
                          onChanged: (val) {
                            var _temp;
                            _temp = (val == '') ? 0.0 : double.parse(val);
                            setState(() {
                              _sellPrice = _temp;
                            });
                            calculateValues();
                          },
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: TextField(
                          controller: _controllerQty,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Qty',
                          ),
                          onChanged: (val) {
                            var _temp;
                            _temp = (val == '') ? 0 : int.parse(val);
                            setState(() {
                              _quantity = _temp;
                            });
                            calculateValues();
                          },
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 15.0),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(onPressed: () {
                          setState(() {
                            _buyPrice = 0;
                            _sellPrice = 0;
                            _quantity = 0;
                          });
                          _controllerBuy.clear();
                          _controllerSell.clear();
                          _controllerQty.clear();

                          calculateValues();
                        },
                          child: Text('Reset Values'),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25.0),

                  Text(
                    'Price per unit',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                    ),
                  ),

                  Text(
                    '\$ ${(_pricePerUnit ?? 0).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.black45,
                    ),
                  ),

                  SizedBox(height: 35.0),

                  Text(
                    'Percentage',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    '% ${(_percentage ?? 0).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.black45,
                    ),
                  ),

                  SizedBox(height: 35.0),

                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    '\$ ${(_total ?? 0).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.black45,
                    ),
                  ),

                  SizedBox(height: 35.0),

                  Visibility(
                    visible: (_buyPrice != 0),
                    child: Row(
                      children: [
                        InputChip(label: Text("5%"),
                          onPressed: () {
                            setState(() {
                              _sellPrice = (_buyPrice * 1.05) ?? 0;
                              _controllerSell.text = _sellPrice.toStringAsFixed(2);
                            });
                            calculateValues();
                          },
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor: Colors.green[50],
                        ),
                        SizedBox(width: 5,),

                        InputChip(label: Text("10%"),
                          onPressed: () {
                            setState(() {
                              _sellPrice = (_buyPrice * 1.10) ?? 0;
                              _controllerSell.text = _sellPrice.toStringAsFixed(2);
                            });
                            calculateValues();
                          },
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor: Colors.green[50],
                        ),
                        SizedBox(width: 5,),

                        InputChip(label: Text("15%"),
                          onPressed: () {
                            setState(() {
                              _sellPrice = (_buyPrice * 1.15) ?? 0;
                              _controllerSell.text = _sellPrice.toStringAsFixed(2);
                            });
                            calculateValues();
                          },
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor: Colors.green[50],
                        ),
                        SizedBox(width: 5,),

                        InputChip(label: Text("20%"),
                          onPressed: () {
                            setState(() {
                              _sellPrice = (_buyPrice * 1.20) ?? 0;
                              _controllerSell.text = _sellPrice.toStringAsFixed(2);
                            });
                            calculateValues();
                          },
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor: Colors.green[50],
                        ),
                        SizedBox(width: 5,),

                        InputChip(label: Text("25%"),
                          onPressed: () {
                            setState(() {
                              _sellPrice = (_buyPrice * 1.25) ?? 0;
                              _controllerSell.text = _sellPrice.toStringAsFixed(2);
                            });
                            calculateValues();
                          },
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor: Colors.green[50],
                        ),
                        SizedBox(width: 5,),

                      ],
                    )
                  ),

                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
