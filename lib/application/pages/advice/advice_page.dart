import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Advicer',
            style: themeData.textTheme.headlineLarge,
          ),
          centerTitle: true,
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: const [
              Expanded(
                child: Center(
                  child: ErrorMessage(message: 'uuups something gone wrong!'),
                  // child: AdviceField(
                  //   advice: 'example advice - tour day will be good!',
                  // ),
                  // child: CircularProgressIndicator(
                  //   color: themeData.colorScheme.secondary,
                  // ),
                  // child: Text(
                  //   'Your Advice is Waiting for you!',
                  //   style: themeData.textTheme.bodyLarge,
                  // ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(child: CustomButton()),
              ),
            ],
          ),
        ));
  }
}
