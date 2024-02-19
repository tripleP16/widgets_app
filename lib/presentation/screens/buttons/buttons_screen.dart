import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Botones'),
        ),
        body: const _ButtonsLayout(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back),
        ));
  }
}

class _ButtonsLayout extends StatelessWidget {
  const _ButtonsLayout();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          runSpacing: 10,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('ElevatedButton')),
            const ElevatedButton(
                onPressed: null, child: Text('ElevatedDisabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('ElevatedButton.icon')),
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_sharp),
                label: const Text('Filled.icon')),
            OutlinedButton(
                onPressed: () {}, child: const Text('OutlinedButton')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text('Outlined.icon')),
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text('TextButton.icon')),
            const CustomButton(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.add_alert_outlined)),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_alert_outlined,
                color: Colors.white,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          splashColor: colors.secondary,
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
