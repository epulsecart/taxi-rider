import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bloc/locations_cubit.dart';

class AnimatedMarker extends StatefulWidget {
  const AnimatedMarker({Key? key, required this.controller}) : super(key: key);
  final AnimatedMarkerController controller;

  @override
  State<StatefulWidget> createState() => _AnimationMarker();
}

class _AnimationMarker extends State<AnimatedMarker>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
  AnimationController(vsync: this);
  String address = " ";

  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.isScrolling) {
        _pickMarker();
      } else {
        _dropMarker();
      }
    });
    super.initState();
  }

  void _pickMarker() {
    _animationController
        .animateTo(0.65, duration: const Duration(milliseconds: 1000))
        .orCancel;
  }

  void _dropMarker() {
    _animationController
        .animateTo(0, duration: const Duration(milliseconds: 1000))
        .orCancel;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        Container(
          margin: const EdgeInsets.only(top:80),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3))
              ]),
          child: Row(children: [

            BlocBuilder<LocationsCubit, LocationsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CupertinoActivityIndicator();
                  } else {
                    return Marquee(
                      text: state.address ?? "",
                      blankSpace: 20.0,
                      textDirection :TextDirection.rtl,
                      velocity: 30,
                      pauseAfterRound: const Duration(seconds: 2),
                    );
                  }
                }).pOnly(left: 0).w(MediaQuery.of(context).size.width - MediaQuery.of(context).size.width /6).h(40),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
              ).p8(),
            ),
          ]),
        ).p(8),
        SizedBox(height: MediaQuery.of(context).size.height/5.1,),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "images/expanding_marker.json",
                width: 117,
                height: 90,
                fit: BoxFit.fitHeight,
                controller: _animationController,
              ),
              RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    color: Colors.green,
                    height: 10,
                    width: 20,
                  ),
                ),
              ),
            ]
        ),
      ],
    );
  }
}

class AnimatedMarkerController extends ChangeNotifier {
  bool isScrolling = false;

  void startScrolling() {
    isScrolling = true;
    notifyListeners();
  }

  void stopScrolling() {
    isScrolling = false;
    notifyListeners();
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
