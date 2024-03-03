import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) {
              isDeveloper = value;
              setState(() {});
            }),
        ExpansionTile(
          title: const Text('Medios de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Transporte por auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transportation.car;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text('Transporte por avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transportation.plane;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text('Transporte por bote'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transportation.boat;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text('Transporte por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transportation.submarine;
                setState(() {});
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Incluye desayuno ?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluye almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluye cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
