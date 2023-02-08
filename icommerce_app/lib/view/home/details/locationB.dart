import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class Lotti extends StatelessWidget {
  const Lotti({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.network("https://lottiefiles.com/85487-location"),
    );
  }
}