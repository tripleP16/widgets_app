import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    final snackbar = SnackBar(
      content: const Text('Hola mundo '),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Estas seguro ?'),
          content: const Text(
              'Nulla officia adipisicing consequat mollit. Cillum anim do incididunt ea id eu aute culpa ipsum ea. Excepteur eiusmod eu irure in veniam nulla officia. Consequat ad nisi amet consectetur eu.'),
          actions: [
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Cerrar')),
            FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Aceptar')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackbar(context),
          label: const Text('Mostrar Snackbar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Ad non est esse in in consectetur in nulla sunt tempor exercitation amet. Ea magna labore Lorem duis culpa sit eu non amet consectetur amet. Ex laborum anim duis et duis dolore. Consectetur in do consectetur cupidatat voluptate anim consectetur.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Mostrar dialogo ')),
          ],
        ),
      ),
    );
  }
}
