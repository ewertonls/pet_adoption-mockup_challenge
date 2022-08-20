import 'dart:math';

import 'package:flutter/material.dart';

import '../../../pet/models/pet_model.dart';
import '../../../theme/app_mediaquery_extension.dart';

class PetImageGallery extends StatefulWidget {
  const PetImageGallery({
    super.key,
    required this.imagebackgroundColor,
    required this.pet,
    this.maxHeight = 600,
  });

  final Color imagebackgroundColor;
  final PetModel pet;
  final double maxHeight;

  @override
  State<PetImageGallery> createState() => _PetImageGalleryState();
}

class _PetImageGalleryState extends State<PetImageGallery> {
  late List<String> petPhotos;
  final selectedIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    petPhotos = widget.pet.photos;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final maxParagraphWidth = context.maxParagraphWidth;
    return SizedBox(
      width: maxParagraphWidth,
      child: LimitedBox(
        maxHeight: min(widget.maxHeight, screenSize.height * 0.8),
        child: AspectRatio(
          aspectRatio: 1,
          child: ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: (context, int currentIndex, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _ImageGalleryItemsList(
                    selectedIndex: selectedIndex,
                    petPhotos: petPhotos,
                    width: 76,
                  ),
                  const SizedBox.square(dimension: 12),
                  Flexible(
                    child: Center(
                      child: _PetImageGalleryViewer(
                        imagebackgroundColor: widget.imagebackgroundColor,
                        petPhotos: petPhotos[currentIndex],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PetImageGalleryViewer extends StatelessWidget {
  const _PetImageGalleryViewer({
    Key? key,
    required this.imagebackgroundColor,
    required this.petPhotos,
  }) : super(key: key);

  final Color imagebackgroundColor;
  final String petPhotos;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: imagebackgroundColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                petPhotos,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageGalleryItemsList extends StatelessWidget {
  _ImageGalleryItemsList({
    required this.petPhotos,
    this.width = 80,
    required this.selectedIndex,
  });

  final List<String> petPhotos;
  final double width;
  final ValueNotifier<int> selectedIndex;

  final controller = ScrollController(keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return ShaderMask(
          blendMode: BlendMode.dstOut,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: const [
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
              stops: _buildShaderStops(spacing),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          child: SizedBox(
            width: width,
            child: ListView.separated(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: spacing),
              itemCount: petPhotos.length,
              itemBuilder: (context, index) {
                return _ImageGalleryItem(
                  selectedIndex: selectedIndex,
                  itemIndex: index,
                  photos: petPhotos,
                );
              },
              separatorBuilder: (_, __) {
                return SizedBox.square(
                  dimension: spacing,
                );
              },
            ),
          ),
        );
      },
    );
  }

  List<double> _buildShaderStops(double size) {
    final bool hasBefore = controller.position.extentBefore > size;
    final bool hasAfter = controller.position.extentAfter > size;
    final stops = <double>[0, hasBefore ? 0.2 : 0, hasAfter ? 0.8 : 1, 1];
    return stops;
  }
}

class _ImageGalleryItem extends StatelessWidget {
  const _ImageGalleryItem({
    required this.selectedIndex,
    required this.itemIndex,
    required this.photos,
  });

  final ValueNotifier<int> selectedIndex;
  final int itemIndex;
  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = context.radius;

    return Material(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          selectedIndex.value = itemIndex;
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: ShapeDecoration(
              color: selectedIndex.value == itemIndex
                  ? theme.colorScheme.onInverseSurface.withOpacity(0.1)
                  : theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.onInverseSurface.withOpacity(0.4),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: Image.asset(
              photos[itemIndex],
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),
      ),
    );
  }
}
