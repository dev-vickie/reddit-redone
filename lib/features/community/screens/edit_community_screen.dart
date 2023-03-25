import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/core/common/error_text.dart';
import 'package:reddit/core/common/loader.dart';
import 'package:reddit/core/constants/constants.dart';
import 'package:reddit/core/utils.dart';
import 'package:reddit/features/community/controller/community_controller.dart';
import 'package:reddit/models/community_model.dart';
import 'package:reddit/theme/pallete.dart';

class EditCommunityScreen extends ConsumerStatefulWidget {
  final String name;
  const EditCommunityScreen({super.key, required this.name});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCommunityScreenState();
}

class _EditCommunityScreenState extends ConsumerState<EditCommunityScreen> {
  File? bannerImage;
  File? avatarImage;

  void selectBannerImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        bannerImage = File(res.files.first.path!);
      });
    }
  }

  void selectAvatarImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        avatarImage = File(res.files.first.path!);
      });
    }
  }

  void save(Community community) {
    ref.read(communityControllerProvider.notifier).editCommunity(
          avatarFile: avatarImage,
          bannerFile: bannerImage,
          context: context,
          community: community,
        );
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(communityControllerProvider);
    return ref.watch(getCommunityByNameProvider(widget.name)).when(
        data: (community) => Scaffold(
              backgroundColor: Pallete.darkModeAppTheme.backgroundColor,
              appBar: AppBar(
                title: const Text("Edit Community"),
                actions: [
                  TextButton(
                    onPressed: () => save(community),
                    child: const Text("save"),
                  ),
                ],
              ),
              body:isLoading ? const Loader() : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: selectBannerImage,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              color: Pallete
                                  .darkModeAppTheme.textTheme.bodyText2!.color!,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: bannerImage != null
                                    ? Image.file(bannerImage!)
                                    : community.banner.isEmpty ||
                                            community.banner ==
                                                Constants.bannerDefault
                                        ? const Center(
                                            child: Icon(
                                            Icons.camera_alt_rounded,
                                            size: 40,
                                          ))
                                        : Image.network(community.banner),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: GestureDetector(
                              onTap: selectAvatarImage,
                              child: avatarImage != null
                                  ? CircleAvatar(
                                      radius: 32,
                                      backgroundImage: FileImage(avatarImage!),
                                    )
                                  : CircleAvatar(
                                      radius: 32,
                                      backgroundImage:
                                          NetworkImage(community.avatar),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
