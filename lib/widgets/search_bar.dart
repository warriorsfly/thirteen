// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    @required this.controller,
    @required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool cleaning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xf7f7f7),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
            ),
            Expanded(
              child: CupertinoTextField(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: const Color(0xf7f7f7),
                ),
                controller: widget.controller,
                focusNode: widget.focusNode,
              ),
            ),
            Visibility(
              visible: cleaning,
              child: GestureDetector(
                onTap: widget.controller.clear,
                child: const Icon(
                  CupertinoIcons.clear_circled,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
