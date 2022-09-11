import 'dart:math';
import 'dart:async';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 bool isMale = true;
 double height = 180;
 int weight =62;
 int age = 20;
 late Timer timer;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Body Mass Index',),
      
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment :MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    expandedFun(context, 'male'),
                     const SizedBox(width : 14),
                    expandedFun(context, 'female')
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)
              ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',style: Theme.of(context).textTheme.headline2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline :TextBaseline.alphabetic,
                        children: [
                        Text(height.toStringAsFixed(1),style: Theme.of(context).textTheme.headline1,),
                        const SizedBox(width: 5,),
                        Text('CM',style: Theme.of(context).textTheme.bodyText1,)
                      ],),
                      Slider(value: height, onChanged: (val){
                        setState(() {
                          height = val ;
                        });
                      },
                      min: 40,
                      max: 250,
                      )
                    ],
                  ),
                )
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    expandedFun2(context, 'age'),
                     const SizedBox(width : 20),
                    expandedFun2(context, 'weight')
                  ],
                ),
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width/1.7,
              height:MediaQuery.of(context).size.height/18 ,
              child: ElevatedButton(
                onPressed: (){
                  double result = weight/ pow(height/100, 2) ;
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                   return Result(result: result, age: age, isMale: isMale);
                  }
                  )
                  );
                 
                },
                 child: const Text('Calculate',style: TextStyle(fontSize: 20),) ) ,)
          ],
        ),
        ),
      );
    
  }

  Expanded expandedFun(BuildContext context,String type) {
    return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = type == 'male'? true:false ;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color:(type=='male'&& isMale)||(type=='female'&&!isMale)? Colors.teal: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)
                ),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Icon( type == 'male'?Icons.man:Icons.woman, size: 90,color: Colors.white,),
               const SizedBox(height: 15,),
               Text(type == 'male'?'Male':'Female' ,style: Theme.of(context).textTheme.headline2,)
             ],
            )),
          ),
        );
  }
  Expanded expandedFun2(BuildContext context,String type) {
    return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)
              ),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(type == 'age'?'Age':'Weight' ,style: Theme.of(context).textTheme.headline2,),
             const SizedBox(height: 15,),
             Text(type == 'age'?'$age':'$weight',style: Theme.of(context).textTheme.headline1,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 GestureDetector(
                  
                  onLongPressStart: (_) {
                      timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
                        setState(() {
                          type == 'age'? age++ : weight++;

                        });
                      });
                  },
                  onLongPressEnd: (_){
                   timer.cancel();
                  },
                   child: FloatingActionButton(onPressed: (){
                    setState(() {
                      type == 'age'? age++ : weight++;
                    });
                     },
                                 
                 
                      heroTag: type == 'age'?'age++':'Weight++',
                      child: const Icon(Icons.add,size: 25,),
                      mini: true,
                                 ),
                 ),

                const SizedBox(width: 20,),
                   
                GestureDetector(
                  onLongPressStart:(_){
                    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
                        setState(() {
                          type == 'age'? age-- : weight--;

                        });
                      });
                  } ,
                  onLongPressEnd: (_){
                   timer.cancel();
                  },


                  child: FloatingActionButton(onPressed: (){
                    setState(() {
                       type == 'age'? age-- : weight--;
                    });
                  },
                  heroTag: type == 'age'?'age--':'Weight--',
                  child: const Icon(Icons.remove ,size: 25,),
                  mini: true,
                  ),
                )
              ],
             )
           ],
          )),
        );
  }
}