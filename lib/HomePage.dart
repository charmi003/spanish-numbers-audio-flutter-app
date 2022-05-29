import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
} 


class _HomePageState extends State<HomePage> {

  AudioCache audioPlayer=AudioCache();

  List<NumberAudio> numberList=[
    NumberAudio(audioUri: "one.wav", buttonColor: Colors.red, englishText: "1", spanishText:"Uno"),
    NumberAudio(audioUri: "two.wav", buttonColor: Colors.blue, englishText: "2", spanishText:"Dos"),
    NumberAudio(audioUri: "three.wav", buttonColor: Colors.green, englishText: "3", spanishText:"Tres"),
    NumberAudio(audioUri: "four.wav", buttonColor: Colors.pink, englishText: "4", spanishText:"Cuatro"),
    NumberAudio(audioUri: "five.wav", buttonColor: Colors.brown, englishText: "5", spanishText:"Cinco"),
    NumberAudio(audioUri: "six.wav", buttonColor: Colors.blueGrey, englishText: "6", spanishText:"Sies"),
    NumberAudio(audioUri: "seven.wav", buttonColor: Colors.teal, englishText: "7", spanishText:"Seite"),
    NumberAudio(audioUri: "eight.wav", buttonColor: Colors.grey, englishText: "8", spanishText:"Ocho"),
    NumberAudio(audioUri: "nine.wav", buttonColor: Colors.amber, englishText: "9", spanishText:"Nueve"),
    NumberAudio(audioUri: "ten.wav", buttonColor: Colors.orange, englishText: "10", spanishText:"Dietz"),
  ];
  //? audioUri: "one.wav" and not "assets/one.wav" because ..package audioPlayer... play(uri)...it automatically adds assets/ and then the given uri...so 

  play(String uri)
  {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Spanish Numbers')
      ),
      body:Container(
        child:Center(
          child:Column(
            children: [
              const Image(
                image:AssetImage('images/logo.png'),
              ),

              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,  //? cross axis --> left to right, .. 5 items per row
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context,i) => SizedBox(
                    height: 50, 
                    width: 100,
                    child: OutlinedButton(
                      onPressed: (){play(numberList[i].audioUri);},
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text(numberList[i].englishText, style: const TextStyle(color:Colors.white, fontSize:20),),
                          Padding(
                            padding: const EdgeInsets.only(top:6),
                            child: Text(numberList[i].spanishText, style: const TextStyle(color:Colors.white, fontSize:20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(numberList[i].buttonColor)),
                    ),
                  ) 
                ),
              )
            ],
          )
        )
      )
      
      
    );
  }
}