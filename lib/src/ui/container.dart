import 'package:jaspr/browser.dart';

///* A container that holds a child.
/// This is a [Jaspr] Component that holds a child.
/// It acts as a [container] aka [div] for the child.
/// It can be used to wrap a child in a container
/// with a specific width, height, padding, margin, and background color, etc.
class Container extends StatelessComponent {
  ///* The id is required.
  //! The id  must be unique to avoid css conflicts.
  final String id;

  //* The classes of the container.
  ///* This allow you to add custom classes to the container.
  ///* BUT you cannot override the internal classes of the container.
  ///? To override the internal classes, you can must override them using
  /// the [Constructor] of [Container].
  final String classes;

  ///* The width and height are set to 'unset' by default.
  ///* The width and height can be set to 'auto' to automatically adjust to the content.
  final Unit? width, height;

  ///* The padding and margin of the container.
  ///* The padding and margin are set to '0px' by default.
  ///* The padding and margin can be set to any valid CSS value. E.G:
  /// [All]: '8px' 
  /// [Vertical and Horizontal]: '8px 16px'
  /// [top, right, bottom, left]: '8px 16px 24px 32px'.
  final String padding, margin;

  ///* The border radius of the container.
  /// The border radius is set to '0px' by default.
  /// The border radius can be set to any valid CSS value.
  /// This is a [css] <-> [property] that rounds the corners of the container.
  final String radius;

  ///* The child of the container.
  ///* The child is required and must be a valid Component.
  ///* The child is the content of the container.
  /// The child can be any [Jaspr] Component.
  final Component child;

  ///* The alignment of the child along the cross axis.
  ///* The alignment is set to 'start' by default.
  final AlignItems alignItems;

  ///* The alignment of the child along the main axis.
  ///* The alignment is set to 'start' by default.
  final JustifyContent justifyContent;

  ///* The background color of the container.
  ///* The background color is set to 'transparent' by default.
  final Color backgroundColor;

  ///* The blur effect of the container.
  final bool blur;

  ///* The blur radius of the container.
  final double blurRadius;

  Container({
    this.width,
    this.height,
    this.classes = '',
    this.radius = '0px',
    this.margin = '0px',
    this.padding = '0px',
    this.blur = false,
    this.blurRadius = 15,
    this.justifyContent = JustifyContent.start,
    this.alignItems = AlignItems.start,
    this.backgroundColor = Colors.transparent,
    required this.id,
    required this.child,
  }) : super(key: Key(id));

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_container_${key.hashCode}';

    yield Style(styles: [
      css('.$internal').raw({
        'display': 'flex',
        'overflow': 'hidden',
        'transition': 'all 0.5s',
        'width': width?.value ?? 'unset',
        'height': height?.value ?? 'unset',
        'padding': padding,
        'margin': margin,
        'border-radius': radius,
        'align-items': alignItems.value,
        'justify-content': justifyContent.value,
        'background-color': backgroundColor.value,
        'backdrop-filter': blur ? 'blur(${blurRadius}px)' : 'none',
      }),
    ]);

    yield div([child], id: id, classes: '$internal $classes');
  }
}
