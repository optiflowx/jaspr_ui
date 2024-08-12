import 'package:jaspr/browser.dart';

//* This is a simple component that applies padding to its children.
class Padding extends StatelessComponent {
  ///* The id is required.
  //! The id  must be unique to avoid css conflicts.
  final String id;

  // The children to apply padding to.
  final List<Component>? children;

  // This is a css padding value, e.g. '10px', '1em', '5%', etc.
  //? See https://developer.mozilla.org/en-US/docs/Web/CSS/padding
  //? for more information.

  /// Creates a new [Padding] component.
  ///
  /// *You can use [x, y, z, w] to specify different padding values for each side.
  /// *If you only specify two values [x, y], the first will be used for the top and bottom,
  /// *If you only specify one value [x], it will be used for all sides.
  ///
  /// Example:
  /// ```dart
  /// Padding('10px 20px 30px 40px', children: [
  ///  Text('Hello, World!'),
  /// ]),
  ///
  /// Padding('10px 20px', children: [
  ///  Text('Hello, World!'),
  /// ]),
  ///
  /// Padding('10px', children: [
  ///  Text('Hello, World!'),
  /// ]),
  /// ```
  ///

  // !The padding value to apply.
  final String padding;

  const Padding(
    this.padding, {
    super.key,
    this.children,
    required this.id,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_padding_${key.hashCode}';
    yield Style(styles: [
      css('.$internal').raw({'padding': padding}),
    ]);

    yield div(children ?? [], classes: internal, id: id);
  }
}
