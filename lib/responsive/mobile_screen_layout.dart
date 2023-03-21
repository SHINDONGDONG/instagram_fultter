import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_fultter/models/user.dart'as model;
import 'package:instagram_fultter/providers/user_provider.dart';
import 'package:instagram_fultter/utils/colors.dart';
import 'package:instagram_fultter/utils/demensions.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();

}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }
  void navigationTapped(int page){
      pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
      print(_page);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        currentIndex: _page,
        onTap: navigationTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search,color: _page==0? primaryColor:secondaryColor,), label: '',backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(Icons.home,color: _page==1? primaryColor:secondaryColor,), label: '',backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle,color: _page==2? primaryColor:secondaryColor,), label: '',backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,color: _page==3? primaryColor:secondaryColor,), label: '',backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: _page==4? primaryColor:secondaryColor,), label: '',backgroundColor: primaryColor,),
        ],
      ),
    );
  }
}
