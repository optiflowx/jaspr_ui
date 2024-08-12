//* This is a simple component that applies horizontal margin to its children.
import 'package:jaspr/browser.dart';

//* This is a simple component that applies horizontal margin to its children.
class HorizontalGap extends StatelessComponent {  ///* The id is required.
  //! The id  must be unique to avoid css conflicts.
  final String id;
  
    // !This is a css value, e.g. '10px', '1em', '5%', etc.
  /// !Note: This is a css value, e.g. '10px', '1em', '5%', etc.
  /// !but it is a Unit type. You can use the `Unit` class to create
  /// !a new instance of this class.
  ///
  /// Example:
  /// ```dart
  /// HorizontalGap(10.px, children: [
  ///   Text('Hello, World!'),
  /// ]),
  /// 
  final Unit gap;

  const HorizontalGap({super.key, required this.id, required this.gap});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_horizontal_gap_${key.hashCode}';
    yield Style(styles: [
      css('.$internal').raw({
        'display': 'flex',
        'max-height': gap.value,
        'height': gap.value,
        'width': '100%',
      }),
    ]);

    yield div([], classes: internal, id: id);
  }
}

//* This is a simple component that applies vertical margin to its children.
class VerticalGap extends StatelessComponent {
  ///* The id is required.
  ///! The id  must be unique to avoid css conflicts.
  final String id;

  // !This is a css value, e.g. '10px', '1em', '5%', etc.
  /// !Note: This is a css value, e.g. '10px', '1em', '5%', etc.
  /// !but it is a Unit type. You can use the `Unit` class to create
  /// !a new instance of this class.
  ///
  /// Example:
  /// ```dart
  /// VerticalGap(10.px, children: [
  ///   Text('Hello, World!'),
  /// ]),
  final Unit gap;

  const VerticalGap({super.key,
    required this.id,
    required this.gap,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_vertical_gap_${key.hashCode}';
    yield Style(styles: [
      css('.$internal').raw({
        'display': 'flex',
        'width': gap.value,
        'height': '100%',
      }),
    ]);

    yield div([], classes: internal, id: id);
  }
}
