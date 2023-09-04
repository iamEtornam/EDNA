import 'package:edna_app/resources/resources.dart';
import 'package:edna_app/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool _loading = false;
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45))),
                  onPressed: () => _handleSignIn(),
                  child: _loading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            child: CircularProgressIndicator.adaptive(),
                          ))
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.icGoogle,
                              width: 45,
                              height: 45,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Continue with Google',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        )),
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    setState(() {
      _loading = true;
    });
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      final googleSignInAuthentication = await googleSignInAccount?.authentication;
      if(googleSignInAuthentication != null && mounted){
        final name = googleSignInAccount?.displayName?.split(' ')[0];
        context.goNamed(RoutesName.welcome,queryParameters: {'name': name});
      }
    } catch (error) {
      debugPrint('$error');
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Message copied!'),
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        behavior: SnackBarBehavior.floating,
      ));
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
