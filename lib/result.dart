import 'package:bill_splitter/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';


class ResultsPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;
  ResultsPage(this.bill,this.tax,this.friends,this.tip);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String dividedamount='';
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
  @override
  void initState() {
    super.initState();
    divideamount();
    
  }
  

  divideamount() {
    double taxamount=
       double.parse(widget.bill)*(double.parse(widget.tax) / 100.0);
    double finalbill=
      (double.parse(widget.bill) + taxamount + widget.tip)/widget.friends;
    setState(() {
      dividedamount=finalbill.toStringAsFixed(2);
    });
   
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 40),
                  child: Text("Result",textAlign: TextAlign.center,style: GoogleFonts.montserrat(
                  //  letterSpacing: 3.0,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                          ),
                ),
                SizedBox(height: 10,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: const BoxDecoration(color: Colors.yellow),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Equally divided",
                                style: GoogleFonts.montserrat(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                              //  'hellooooo',
                                "\$$dividedamount",
                                style: GoogleFonts.montserrat(
                                    fontSize: 30, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Friends",
                                    style: infostyle,
                                  ),
                                  Text(
                                    "Tax",
                                    style: infostyle,
                                  ),
                                  Text(
                                    "Tip",
                                    style: infostyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.friends.round().toString(),
                                    style: infostyle,
                                  ),
                                  Text(
                                    "${widget.tax} %",
                                    style: infostyle,
                                  ),
                                  Text(
                                    "\$${widget.tip.round().toString()}",
                                    style: infostyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //DONT TOUCH//
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    width: MediaQuery.of(context).size.width*0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 71, 7, 103) ,shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),),
                      onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>BillSplit()));
                    }, child: Text("Split-Again",style: infostyle.copyWith(color: Colors.white),),),
                  ),

                  //DONT TOUCH
              ],
            ),
      ),
         ],
       ),
    );
  }
}
