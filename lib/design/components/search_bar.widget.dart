import 'package:flutter/material.dart';

import '../tokens/constants.token.dart';
import '../tokens/texts.token.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool showClear = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {
        showClear = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) => SearchBar(
        controller: widget.controller,
        textStyle: MaterialStateProperty.all(CustomText.body.style),
        hintText: 'Search...',
        elevation: const MaterialStatePropertyAll(Constants.elevation),
        leading: const Icon(Icons.search),
        trailing: [
          if (showClear)
            IconButton(
              onPressed: () {
                widget.controller.clear();
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.clear),
            )
        ],
      );
}
