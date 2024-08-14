import 'package:jaspr/browser.dart';

class CarouselItem extends StatelessComponent {
  final Component child;
  final double height;

  const CarouselItem({super.key, required this.child, this.height = 425});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_carousel_item';

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
