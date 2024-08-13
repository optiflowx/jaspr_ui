import 'package:jaspr/browser.dart';

///* A simple icon component based on CSS class icons.
/// You can use any icon library that uses CSS classes.
/// For example, you can use Font Awesome, Material Icons,
/// Remix Icons, etc.
///
/// TODO: Add support for SVG icons and documentation.
class Icon extends StatelessComponent {
  final String? id;
  final String icon;
  final Color iconColor;
  final Color backgroundColor;

  final Unit? size;
  final Unit? padding;
  final String margin;
  final Unit? borderRadius;

  final String classes;
  final void Function(Event)? onClick;

  Icon({
    this.id,
    this.size,
    this.margin = '0',
    this.padding,
    this.classes = '',
    this.borderRadius,
    required this.icon,
    this.onClick,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.transparent,
  }) : super(key: Key(id ?? ''));

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_icon_$id';
    yield Style(styles: [
      css('.$internal').raw({
        'font-size': size?.value ?? '24px',
        'padding': padding?.value ?? '5px',
        'margin': margin,
        'color': iconColor.value,
        'background-color': backgroundColor.value,
        'border-radius': borderRadius?.value ?? '0',
      }),
    ]);

    yield i(
      [],
      id: id,
      classes: '$internal $icon $classes',
      events: {
        'click': (e) {
          if (onClick != null) {
            onClick!(e);
          }
        },
      },
    );
  }
}
