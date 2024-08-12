import 'package:jaspr/browser.dart';
import 'package:jaspr_ui/jaspr_ui.dart';

class HorizontalSlider extends StatelessComponent {
  final void Function(Event)? onLeftClick;
  final void Function(Event)? onRightClick;

  final List<HorizontalSliderItem> items;
  const HorizontalSlider({
    super.key,
    required this.items,
    this.onLeftClick,
    this.onRightClick,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_horizontal_slider';
    final iconRight = 'jaspr_ui_horizontal_slider_icon_right';
    final iconLeft = 'jaspr_ui_horizontal_slider_icon_left';
    final wrapper = 'jaspr_ui_horizontal_slider_wrapper';

    // Styles
    yield Style(styles: [
      css('.$wrapper').raw({
        'position': 'relative',
        'width': '100%',
        'height': '100%',
      }),
      css('.$internal').raw({
        'gap': '15px',
        'padding': '0',
        'margin': '5% 0',
        'display': 'grid',
        'grid-auto-flow': 'column',
        'scroll-snap-type': 'x mandatory',
        'scroll-behavior': 'smooth',
        'overflow-x': 'auto',
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

      //Media queries
      MediaQuery.mobile([
        css('.$internal').raw({
          'grid-auto-columns': '100%',
        }),
      ]),

      MediaQuery.tablet([
        css('.$internal').raw({
          'grid-auto-columns': 'calc((100% / 2) - 10px)',
        }),
      ]),

      MediaQuery.laptop([
        css('.$internal').raw({
          'grid-auto-columns': 'calc((100% / 3) - 15px)',
        }),
      ]),

      MediaQuery.desktop([
        css('.$internal').raw({
          'grid-auto-columns': 'calc((100% / 4) - 20px)',
        }),
      ]),
    ]);

    // HorizontalSlider
    yield div(classes: wrapper, [
      Icon(
        id: 'jaspr_ui_left',
        icon: 'ri-arrow-left-wide-line',
        classes: iconLeft,
        iconColor: Colors.black,
        backgroundColor: Colors.white,
        borderRadius: Unit.percent(50),
        onClick: onLeftClick,
      ),
      ul(classes: internal, items, id: internal, events: {
        'click': (event) {},
      }),
      Icon(
        id: 'jaspr_ui_right',
        icon: 'ri-arrow-right-wide-line',
        classes: iconRight,
        iconColor: Colors.black,
        backgroundColor: Colors.white,
        borderRadius: Unit.percent(50),
        onClick: onRightClick,
      ),
    ]);
  }
}
