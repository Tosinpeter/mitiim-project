import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'category_chip_model.dart';
export 'category_chip_model.dart';

class CategoryChipWidget extends StatefulWidget {
  const CategoryChipWidget({
    super.key,
    required this.category,
  });

  final PublishCategory? category;

  @override
  State<CategoryChipWidget> createState() => _CategoryChipWidgetState();
}

class _CategoryChipWidgetState extends State<CategoryChipWidget> {
  late CategoryChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryChipModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.category == PublishCategory.Catering)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-01.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.HomeHelp)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-02.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.Beauty)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-03.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.IT)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-04.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.PrivateLessons)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-05.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.Administrative)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-06.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.Construction)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-07.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.MovingAssembly)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-08.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        if (widget.category == PublishCategory.Delivery)
          Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/CirclePictosNo-09.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
      ],
    );
  }
}
