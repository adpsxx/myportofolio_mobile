import 'package:material_ui/material_ui.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Center(child: Text('No $type found.')),
        ),
      ),
    );
  }
}