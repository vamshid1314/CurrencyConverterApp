import 'package:flutter/material.dart';

class CurrencyMaterialApp extends StatefulWidget{
    const CurrencyMaterialApp({super.key});

    @override
    State<CurrencyMaterialApp> createState() => _CurrencyMaterialAppState();
}

class _CurrencyMaterialAppState extends State<CurrencyMaterialApp>{
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Color(0xFF003366),
      appBar: AppBar(
        backgroundColor: Color(0xFF003366),
        centerTitle: true,
        title: Text(
          "Currency Converter",
          style: TextStyle(
            color: Color(0xFFF1FAEE),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 100),
              child: Text(
                result.toString(),
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                    color: Color(0xFFFFD700)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(
                  color: Color(0xFFF5F5F5),
                ),
                decoration: InputDecoration(
                  hintText:'Enter the amount in INR..',
                  hintStyle: TextStyle(
                    color: Color(0xFFF5F5F5),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFBDBDBD),
                        width: 2.5,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(40)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFBDBDBD),
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(60)
                      )
                  ),
                  prefixIcon: Icon(Icons.currency_exchange_sharp),
                  prefixIconColor: Colors.blueGrey,
                  filled: true,
                  fillColor: Color(0xFF212121),
                ),
                keyboardType: TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      double? input = double.tryParse(textEditingController.text);
                      if(input != null){
                        result = double.parse((input * 86.82).toStringAsFixed(2));
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Color(0xFF00BCD4),
                    foregroundColor: Colors.black,
                    minimumSize: Size(double.infinity,50),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle:
                    TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child:const Text("Convert")
              ),
            ),
          ],
        ),
      ),
    );
  }
}

