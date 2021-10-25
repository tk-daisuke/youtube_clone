import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final filterProvider = StateProvider((ref) => 0);

class YoutubeAppbar extends StatelessWidget {
  const YoutubeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chipTitles = <String>['ALL', '音楽', '映画', 'ペット'];
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                title: const YoutubeLogo(),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  MaterialButton(
                    onPressed: () {},
                    // color: Colors.blue,
                    // textColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 15,
                      foregroundImage: AssetImage('assets/user/avatar.jpg'),
                    ),
                    // padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                  ),
                ],
              ),
            ];
          },
          body: Scaffold(
            appBar: _buildChipBar(chipTitles),
            body: SingleChildScrollView(
              child: Column(children: []),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildChipBar(List<String> chipTitles) {
    return AppBar(
      // title: Text('Youtube'),
      // toolbarHeight: 51, backgroundColor: const Color(0xFF212332),
      // automaticallyImplyLeading: false,
      flexibleSpace: HookBuilder(builder: (context) {
        final filter = useProvider(filterProvider);
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
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.explore_outlined),
                  label: const Text('探索'),
                  style: ElevatedButton.styleFrom(primary: Colors.white24),
                ),
                const VerticalDivider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chipTitles.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final selecte = filter.state == index;
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
                          chipTitles[index],
                          style: TextStyle(
                              color: selecte ? Colors.black : Colors.white),
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            filter.state = index;
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
        );
      }),
      // flexibleSpace: const _FilterBar2(),
    );
  }
}

class YoutubeLogo extends StatelessWidget {
  const YoutubeLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 10, height: 10, color: Colors.white),
            const Icon(
              Icons.smart_display_rounded,
              color: Color(0xFFff0000),
            ),
          ],
        ),
        Text(
          'YouTube',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
                // color: Colors.blue,
                fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
        // Container(
        //   color: Theme.of(context).primaryColor,
        //   child: SafeArea(
        //     child:
        //     NestedScrollView(
        //         headerSliverBuilder: (context, value) {
        //           return [
        //             const SliverAppBar(
        //               title: Text('data'),
        //             ),
        //             // _FilterBar(),
        //           ];
        //         },
        //         body: Scaffold(appBar: _buildChipBar(chipTitles))),
        //   ),
        // )
