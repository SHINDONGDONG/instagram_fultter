

import 'package:flutter/cupertino.dart';
import 'package:instagram_fultter/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../utils/demensions.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {Key? key, required this.webScreenLayout, required this.mobileScreenLayout})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

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
          return widget.webScreenLayout;
        }
        return widget.mobileScreenLayout;
      }
    );
  }
}
