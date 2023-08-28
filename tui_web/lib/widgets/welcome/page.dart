import 'package:tui_lib/tui_lib.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 24),
            Text(
              'Welcome to Fairly Taxed.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            const Text('Manage'),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                context.go(Routes.signIn);
              },
              child: const Text('Sign in or create an account'),
            ),
            TextButton(
              onPressed: () {
                context.go(Routes.chat);
              },
              child: const Text('Another link'),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('header');
  }
}

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('intro');
  }
}

class Company extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('our company');
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('about');
  }
}

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Contact');
  }
}

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Faq');
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Footer');
  }
}
