import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// A simple Jaspr component that counts the number of clicks.
@client
class Clicker extends StatefulComponent {
  const Clicker({super.key});

  @override
  State<Clicker> createState() => ClickerState();
}

class ClickerState extends State<Clicker> {
  int count = 0;

  @override
  Component build(BuildContext context) {
    return button(
      classes: 'border border-slate-300 px-3 py-2 text-sm font-medium text-slate-900',
      onClick: () {
        setState(() => count++);
      },
      [
        .text('Click me! ($count)'),
      ],
    );
  }
}
