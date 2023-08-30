import 'package:edna_app/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => context.goNamed(RoutesName.welcome));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const SafeArea(
        child: Column(

          children: [

            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
