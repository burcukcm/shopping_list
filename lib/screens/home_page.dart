import 'package:flutter/material.dart';
import 'package:flutter_todo_v2/core/constants/app_constants.dart';
import 'package:flutter_todo_v2/screens/shopping_list_screen.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(child: Lottie.asset(AppImages.firstLottie)),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.homePagebuttonColor,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShoppingListScreen()),
              );
            },
            child: Text(
              Strings.homepagetitle,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
