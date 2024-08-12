import 'package:jaspr/browser.dart';

class WidthGuard extends StatelessComponent {
  /// This is the maximum width of the children.
  /// The default is 1440px, but you can change it to any value.
  final Unit maxWidth;

  /// The children to align.
  /// This can be any component.
  /// For example, a [Row], [FlexBox], [Wrap], etc.
  final List<Component> children;

  WidthGuard(this.children, {super.key}) : maxWidth = 1440.px;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Style(styles: [
      css('.width-guard').raw({
        'margin': '0',
        'padding': '0',
        'display': 'flex',
        'height': '100%',
        'width': '100%',
        'position': 'relative',
        'max-width': maxWidth.value,
        'flex-direction': 'column',
        'align-items': 'center',
      }),
    ]);

    yield div(children, classes: 'width-guard');
  }
}
