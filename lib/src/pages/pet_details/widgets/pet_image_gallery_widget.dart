import 'dart:math';

import 'package:flutter/material.dart';

import '../../../pet/models/pet_model.dart';

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
    return SizedBox(
      width: 768,
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
                    theme: theme,
                    width: 76,
                  ),
                  const SizedBox.square(dimension: 12),
                  Flexible(
                    child: _PetImageGalleryViewer(
                      imagebackgroundColor: widget.imagebackgroundColor,
                      petPhotos: petPhotos[currentIndex],
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
              child: Image.asset(petPhotos),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageGalleryItemsList extends StatelessWidget {
  _ImageGalleryItemsList({
    Key? key,
    required this.petPhotos,
    required this.theme,
    this.width = 80,
    required this.selectedIndex,
  }) : super(key: key);

  final List<String> petPhotos;
  final ThemeData theme;
  final double width;
  final ValueNotifier<int> selectedIndex;

  final controller = ScrollController(keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
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
                stops: _buildShaderStops(16),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: SizedBox(
              width: width,
              child: ListView.separated(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: petPhotos.length,
                itemBuilder: (context, index) {
                  return _buildImageGalleryItem(petPhotos, index);
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 16,
                  width: 16,
                ),
              ),
            ),
          );
        });
  }

  List<double> _buildShaderStops(double size) {
    final bool hasBefore = controller.position.extentBefore > size;
    final bool hasAfter = controller.position.extentAfter > size;
    final stops = <double>[0, hasBefore ? 0.2 : 0, hasAfter ? 0.8 : 1, 1];
    return stops;
  }

  Widget _buildImageGalleryItem(List<String> photos, int index) {
    final borderRadius = BorderRadius.circular(16);
    return Material(
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          selectedIndex.value = index;
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: ShapeDecoration(
              color: selectedIndex.value == index
                  ? theme.colorScheme.onInverseSurface.withOpacity(0.1)
                  : theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.onInverseSurface.withOpacity(0.4),
                  width: 2,
                ),
                borderRadius: borderRadius,
              ),
            ),
            child: Image.asset(
              photos[index],
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ),
    );
  }
}
