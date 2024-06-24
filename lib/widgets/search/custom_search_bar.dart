import 'package:bhc_mobile/utils/villages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Widget searchChild(x) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.locationDot,
              size: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              x,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: SearchField<String>(
        suggestionDirection: SuggestionDirection.down,
        onSearchTextChanged: (query) {
          final filter = villages
              .where((element) =>
                  element.toLowerCase().contains(query.toLowerCase()))
              .toList();
          return filter
              .map((e) => SearchFieldListItem<String>(e, child: searchChild(e)))
              .toList();
        },
        scrollbarDecoration: ScrollbarDecoration(
          thickness: 4,
          trackColor: Colors.grey,
          trackBorderColor: Theme.of(context).colorScheme.secondary,
          thumbColor: Theme.of(context).colorScheme.primary,
        ),
        focusNode: widget.focusNode,
        onTapOutside: (x) {
          widget.focusNode.unfocus();
        },
        searchInputDecoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          suffixIcon: const Icon(Icons.search),
        ),
        hint: 'Search by location...',
        maxSuggestionsInViewPort: 5,
        autoCorrect: true,
        autofocus: false,
        searchStyle: Theme.of(context).textTheme.bodySmall?.apply(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
        inputType: TextInputType.text,
        itemHeight: 45.0,
        suggestionsDecoration: SuggestionDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        suggestions: villages
            .map(
              (village) => SearchFieldListItem<String>(
                village,
                item: village,
                // Use child to show Custom Widgets in the suggestions
                // defaults to Text widget
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.locationDot,
                        size: 14,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        village,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
