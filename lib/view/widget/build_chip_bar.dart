import 'package:appbar_custom/item/category_chip.dart';
import 'package:appbar_custom/view/youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Widget buildChipBar() {
  return HookBuilder(builder: (context) {
    final chipIndex = useProvider(chipIndexProvider);
    final filter = useProvider(filterProvider);
    final chips = CategoryChipList().chips;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 1),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white24,
            width: 1,
          ),
          bottom: BorderSide(
            color: Colors.white24,
            width: 1,
          ),
        ),
      ),

      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.explore_outlined),
                  label: const Text('探索'),
                  style: ElevatedButton.styleFrom(primary: Colors.white24),
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chips.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final selecte = chipIndex.state == index;
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 2, left: index == 0 ? 10 : 0, right: 5),
                    child: ChoiceChip(
                      side: const BorderSide(
                        width: 1,
                        color: Colors.white12,
                      ),
                      selected: selecte,
                      selectedColor: Colors.white,
                      disabledColor: Colors.grey,
                      label: Text(
                        chips[index].title,
                        style: TextStyle(
                            color: selecte ? Colors.black : Colors.white),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          chipIndex.state = index;
                          filter.state = chips[index].category;
                          HapticFeedback.lightImpact();
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  });
}
