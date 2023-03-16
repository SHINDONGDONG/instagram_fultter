

import 'package:flutter/cupertino.dart';

import '../utils/demensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {Key? key, required this.webScreenLayout, required this.mobileScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //LyaoutBuilder는 제약조건을 많이 고를 수 있다.
    return LayoutBuilder(
      builder: (context, constraint) {
        /*
        현재 디바이스 maxWidth가 webScreenSize보다 크면
        webScreenLayout을 돌려준다. (웹이니깐)
        */
        if(constraint.maxWidth > webScreenSize ) {
          return webScreenLayout;
        }
        return mobileScreenLayout;
      }
    );
  }
}
