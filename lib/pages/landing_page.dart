import 'package:flutter/material.dart';
import 'package:newsapp/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child:Column(
          children: [
            Material(
              elevation: 5.0,
               borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                "images/lord krishna.jpeg",
                   width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2,
                          fit: BoxFit.cover,
                        ),
              ),
            ),
            //text1
            const SizedBox(height: 20.0,),
            const Text("News From around the\n        world for you",style: TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.bold),),
//text2
            const SizedBox(height: 20.0,),
             const Text("Padhega India To samjhega India\n        Fir Aage Badehga India",style: TextStyle(color: Colors.black38,fontSize: 18.0, fontWeight: FontWeight.bold),),

            const SizedBox(height: 40.0),
             SizedBox(
               width: MediaQuery.of(context).size.width/1.2,
               child: Material(
                //borderradius is gemotery
                 borderRadius: BorderRadius.circular(30),
                elevation: 5.0,
                 child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
                  },
                   child: Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    decoration:   BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30),),
                    child: const Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight:FontWeight.w300),)),
                   
                    
                   ),
                 ),
               ),
             )


      ],
      ),
      ),
    );
  }
}