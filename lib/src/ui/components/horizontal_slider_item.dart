import 'package:jaspr/browser.dart';

class HorizontalSliderItem extends StatelessComponent {
  final Component child;
  final double height;

  const HorizontalSliderItem(
      {super.key, required this.child, this.height = 375});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_horizontal_slider_item';

    yield Style(styles: [
      css('.$internal').raw({
        'height': '${height}px',
        'width': '100%',
        'list-style': 'none',
        'transition': 'transform 0.5s ease',
      })
    ]);

    yield li(classes: internal, [child]);
  }
}
