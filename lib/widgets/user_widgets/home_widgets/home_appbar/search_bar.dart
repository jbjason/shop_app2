import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.circular(5.0),
        child: TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon:
                Icon(Icons.search, color: Color(0xFFFEDF62), size: 30.0),
            contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
