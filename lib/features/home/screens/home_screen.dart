import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/controllers/auth_controller.dart';
import 'package:reddit/features/home/drawers/profile_drawer.dart';

import '../delegates/search_delegate.dart';
import '../drawers/community_list_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void openEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => openDrawer(context),
          );
        }),
        centerTitle: false,
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchCommunityDelegate(ref: ref));
            },
            icon: const Icon(Icons.search),
          ),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => openEndDrawer(context),
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
            );
          }),
        ],
      ),
      drawer: const CommunityListDrawer(),
      endDrawer: const ProfileDrawer(),
    );
  }
}
