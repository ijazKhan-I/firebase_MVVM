import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitIndicator extends StatefulWidget {
  const SpinkitIndicator({Key? key}) : super(key: key);

  @override
  State<SpinkitIndicator> createState() => _SpinkitIndicatorState();
}

class _SpinkitIndicatorState extends State<SpinkitIndicator> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpinKitThreeBounce(color: Colors.blue),
            SpinKitWanderingCubes(color: Colors.yellow),
            SpinKitWanderingCubes(color: Colors.black, shape: BoxShape.circle),
            SpinKitCircle(color: Colors.amberAccent),
            SpinKitFadingFour(color: Colors.red),
            SpinKitFadingFour(color: Colors.redAccent, shape: BoxShape.rectangle),
            SpinKitFadingCube(color: Colors.green),
            SpinKitCubeGrid(size: 51.0, color: Colors.greenAccent),
            SpinKitFoldingCube(color: Colors.pink),
            SpinKitRing(color: Colors.pinkAccent),
            SpinKitDualRing(color: Colors.brown),
            SpinKitRipple(color: Colors.yellow),
            SpinKitFadingGrid(color: Colors.yellowAccent),
            SpinKitFadingGrid(color: Colors.greenAccent, shape: BoxShape.rectangle),
            SpinKitHourGlass(color: Colors.black),
            SpinKitSpinningCircle(color: Colors.teal),
            SpinKitSpinningCircle(color: Colors.tealAccent, shape: BoxShape.rectangle),
            SpinKitFadingCircle(color: Colors.pinkAccent),

            SpinKitChasingDots(color: Colors.blue),
            SpinKitPumpingHeart(color: Colors.black),
            SpinKitPulse(color: Colors.amber),
            SpinKitDoubleBounce(color: Colors.teal),
            SpinKitWave(color: Colors.red, type: SpinKitWaveType.start),
            SpinKitWave(color: Colors.pink, type: SpinKitWaveType.center),
            SpinKitWave(color: Colors.yellow, type: SpinKitWaveType.end),
            SpinKitRotatingPlain(color: Colors.green),
            SpinKitChasingDots(
              color: Colors.indigo,
            ),
            SpinKitCircle(
              color: Colors.amber,
            ),
            SpinKitDancingSquare(
              color: Colors.blueAccent,
            ),
            SpinKitDoubleBounce(
              color: Colors.pink,
            ),
            SpinKitFadingGrid(
              color: Colors.orange,
            ),
            SpinKitWanderingCubes(
              color: Colors.teal,
            ),
            SpinKitHourGlass(color: Colors.lightGreenAccent),
            SpinKitDualRing(
              color: Colors.cyan,
            ),
            SpinKitRotatingCircle(color: Colors.red),
          ],
        ),
      ),
    );
  }
}
