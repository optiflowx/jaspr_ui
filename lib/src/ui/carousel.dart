import 'package:jaspr/browser.dart';
import 'package:jaspr_ui/jaspr_ui.dart';

class Carousel extends StatelessComponent {
  final String id, padding, margin;

  final List<CarouselItem> items;
  const Carousel({
    super.key,
    required this.id,
    required this.items,
    this.padding = '0',
    this.margin = '0',
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_carousel';
    final iconRight = 'jaspr_ui_carousel_icon_right';
    final iconLeft = 'jaspr_ui_carousel_icon_left';
    final wrapper = 'jaspr_ui_carousel_wrapper';

    // Styles
    yield Style(styles: [
      css('.$wrapper').raw({
        'position': 'relative',
        'width': '100%',
        'height': '100%',
      }),
      css('.$internal').raw({
        'gap': '20px',
        'padding': padding,
        'margin': margin,
        'display': 'grid',
        'grid-auto-flow': 'column',
        'grid-auto-columns': '100%',
        'scroll-snap-type': 'x mandatory',
        'scroll-behavior': 'smooth',
        'overflow-x': 'auto',
        'overflow-y': 'hidden',
        'scrollbar-width': 'none',
        '-ms-overflow-style': 'none',
      }),
      css('.$iconLeft').raw({
        'position': 'absolute',
        'top': '50%',
        'left': '15px',
        'z-index': '50',
        'transform': 'translateY(-50%)',
        'cursor': 'pointer',
      }),
      css('.$iconRight').raw({
        'position': 'absolute',
        'top': '50%',
        'right': '15px',
        'z-index': '50',
        'margin': '10px',
        'transform': 'translateY(-50%)',
        'cursor': 'pointer',
      }),
    ]);

    // HorizontalSlider
    yield div(classes: wrapper, [
      Icon(
        id: 'jaspr_ui_carousel_left',
        icon: 'ri-arrow-left-wide-line',
        classes: iconLeft,
        iconColor: Colors.black,
        backgroundColor: Colors.white,
        borderRadius: Unit.percent(50),
      ),
      ul(classes: internal, items, id: internal, events: {
        'click': (event) {},
      }),
      Icon(
        id: 'jaspr_ui_carousel_right',
        icon: 'ri-arrow-right-wide-line',
        classes: iconRight,
        iconColor: Colors.black,
        backgroundColor: Colors.white,
        borderRadius: Unit.percent(50),
      ),
    ]);
  }
}
