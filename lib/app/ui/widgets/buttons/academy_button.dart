import 'package:flutter/material.dart';

class AcademyButton extends StatefulWidget {
  final String? title;
  final String? content;
  final ImageProvider<Object>? image;
  final double? imageWidth;
  final double? imageHeight;
  final Function()? onPressed;
  final Color? color;
  final String? heroTag;
  const AcademyButton({
    Key? key,
    this.title,
    this.content,
    this.image,
    this.imageWidth,
    this.imageHeight,
    this.onPressed,
    this.color,
    this.heroTag,
  }) : super(key: key);

  @override
  State<AcademyButton> createState() => _AcademyButtonState();
}

class _AcademyButtonState extends State<AcademyButton> {
  bool isTappedDown = false;

  Widget content(width) => _OpacityContent(
        opacity: isTappedDown ? 0.7 : 1.0,
        width: width,
        title: widget.title,
        content: widget.content,
        image: widget.image,
        imageWidth: widget.imageWidth,
        imageHeight: widget.imageHeight,
        color: widget.color ?? Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (details) {
          setState(() {
            isTappedDown = true;
          });
        },
        onTapCancel: () {
          setState(() {
            isTappedDown = false;
          });
        },
        onLongPress: () {
          setState(() {
            isTappedDown = false;
          });
        },
        onTapUp: (details) {
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              isTappedDown = false;
            });
            widget.onPressed?.call();
          });
        },
        child: widget.heroTag != null
            ? Hero(tag: widget.heroTag!, child: content(width))
            : content(width),
      );
    });
  }
}

class _OpacityContent extends StatelessWidget {
  final double opacity;
  final double width;
  final String? title;
  final String? content;
  final ImageProvider<Object>? image;
  final double? imageWidth;
  final double? imageHeight;
  final Color color;

  const _OpacityContent({
    Key? key,
    required this.opacity,
    required this.width,
    this.title,
    this.content,
    this.image,
    this.imageWidth,
    this.imageHeight,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Material(
        color: color,
        shadowColor: HSLColor.fromColor(color).withLightness(0.5).toColor(),
        elevation: 6.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              image != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: image!,
                          width: imageWidth,
                          height: imageHeight,
                          fit: (imageWidth != null && imageHeight != null)
                              ? BoxFit.fill
                              : BoxFit.contain,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: title != null,
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 10 + width / 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: content != null,
                      child: const SizedBox(height: 10)),
                  Visibility(
                    visible: content != null,
                    child: Text(
                      content ?? '',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 6 + width / 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
