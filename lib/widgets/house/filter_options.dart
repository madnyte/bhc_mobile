import 'package:bhc_mobile/utils/constants.dart';
import 'package:bhc_mobile/widgets/custom_choice_chip.dart';
import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions(
      {super.key, required this.selectedFilter, required this.setFilter});

  final HouseFilterOptions selectedFilter;
  final Function(HouseFilterOptions) setFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomChoiceChip(
          label: "Newly Added",
          selected: selectedFilter == HouseFilterOptions.added,
          onSelected: (value) {
            setFilter(HouseFilterOptions.added);
          },
        ),
        const SizedBox(
          width: 10.0,
        ),
        CustomChoiceChip(
          label: "For Sale",
          selected: selectedFilter == HouseFilterOptions.sale,
          onSelected: (value) {
            setFilter(HouseFilterOptions.sale);
          },
        ),
        const SizedBox(
          width: 10.0,
        ),
        CustomChoiceChip(
          label: "For Rent",
          selected: selectedFilter == HouseFilterOptions.rent,
          onSelected: (value) {
            setFilter(HouseFilterOptions.rent);
          },
        )
      ],
    );
  }
}
