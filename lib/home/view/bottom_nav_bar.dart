import 'package:flutter/material.dart';
import 'package:otoo/account/controller/account_screen.dart';
import 'package:otoo/activity/view/activity_screen.dart';
import 'package:otoo/home/controller/provider/local_function_provider.dart';
import 'package:otoo/home/view/home_screen.dart';
import 'package:otoo/services/view/service_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  final screens = const [
    HomeScreen(),
    ServiceScreen(),
    ActivityScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalFunctionsProvider>(context);
    return Scaffold(
      body: screens[provider.index],
      bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
              indicatorColor: Color.fromARGB(255, 255, 255, 255)),
          child: Consumer<LocalFunctionsProvider>(
            builder: (context, value, child) => NavigationBar(
                selectedIndex: provider.index,
                onDestinationSelected: (index) => value.changeIndex(index),
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: ""),
                  NavigationDestination(
                      icon: Icon(Icons.grid_view_rounded), label: ""),
                  NavigationDestination(
                      icon: Icon(Icons.receipt_rounded), label: ""),
                  NavigationDestination(icon: Icon(Icons.person), label: "")
                ]),
          )),
    );
  }
}
