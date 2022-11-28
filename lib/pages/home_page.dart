import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bool _isLogged = true;

  final SpringController springController =
  SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/im_party.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.4),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _slideAnimation(300, 100.0, 0.0,
                const Text('Find the best parties near you.', style: TextStyle(color: Colors.yellow, fontSize: 40)),
              ),
              const SizedBox(height: 10,),
              _slideAnimation(300, 200.0, 0.0,
                const Text('Let us find you a party for your interest', style: TextStyle(color: Colors.greenAccent, fontSize: 25)),
              ),
              const SizedBox(height: 200,),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _isLogged ?
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow[900]
                    ),
                    child: const Center(
                      child: Text('Start', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ):
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text('Google+', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }

  Widget _slideAnimation(delay, y1, y2, child){
    return Spring.slide(
        springController: springController,
        slideType: SlideType.slide_in_top,
        withFade: true,
        cutomTweenOffset: Tween(begin: Offset(0,y1), end: Offset(0,y2)),
        delay: Duration(milliseconds: delay),
        child: child
    );
  }

}
