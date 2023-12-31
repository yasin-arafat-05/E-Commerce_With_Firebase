// ignore_for_file: library_private_types_in_public_api

import 'package:eapp/screens/cart_screen/cart_screen.dart';
import 'package:eapp/screens/favourite_screen/favourite_screen.dart';
import 'package:eapp/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final PersistentTabController _controller = PersistentTabController();
  final bool _hideNavBar = false;

  List<Widget> _buildScreens() => [
        const Home(),
        const CartScreen(),
        const FavouriteScreen(),
        const FavouriteScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        //---------------------------Home Screen--------------------------------
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.purple,
          inactiveIcon: const Icon(Icons.home_outlined),
        ),

        //---------------------------Cart Screen--------------------------------
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: "Cart",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          inactiveIcon: const Icon(Icons.shopping_cart_outlined),
        ),
        //--------------------------Favourite Screen----------------------------
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
          title: "Favourite",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          inactiveIcon: const Icon(Icons.favorite_outline),
        ),
        //--------------------------Profile Screen----------------------------
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Profile",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          inactiveIcon: const Icon(Icons.person_outlined),
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          backgroundColor: Colors.red.shade300,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style19, // Choose the nav bar style with this property
        ),
      );
}
