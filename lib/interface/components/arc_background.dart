import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class ArcBackground extends StatelessWidget {
  const ArcBackground(
      {this.heading = "Let's get Started!",
      this.subheading = '',
      required this.child,
      super.key});
  final String heading, subheading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: AppColors.tertiary,
        child: SafeArea(
          child: Container(
            color: AppColors.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/images/design/onboarding1_head copy.svg',
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //   image: const DecorationImage(
                          //     image: AssetImage(
                          //         'assets/images/design/TitleCurve.png'),
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          padding: EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(),
                              Text(
                                heading,
                                style: AppTextStyles.heading,
                              ),
                              if (subheading.isNotEmpty)
                                Text(
                                  heading,
                                  style: AppTextStyles.subheading,
                                ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 30,
                        left: 0,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child:
                            Image.asset('assets/images/design/LeftCircles.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.asset(
                            'assets/images/design/RightCircles.png'),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.8,
                        child: child,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
