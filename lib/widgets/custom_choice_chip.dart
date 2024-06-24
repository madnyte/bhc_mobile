import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key,
      required this.selected,
      required this.onSelected,
      required this.label});

  final String label;
  final bool selected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      label: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.apply(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
      disabledColor: Theme.of(context).colorScheme.primary,
      color: WidgetStateColor.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).colorScheme.secondaryContainer;
      }),
      selected: selected,
      elevation: 4.0,
      onSelected: onSelected,
    );
  }
}
