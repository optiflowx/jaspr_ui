// This is a simple component that aligns its children vertically.
import 'package:jaspr/browser.dart';
import '../../jaspr_ui.dart';

// This is a simple component that aligns its children vertically.
class Column extends StatelessComponent {
  ///* The id is required.
  //! The id  must be unique to avoid css conflicts.
  final String id;

  //* The alignment of the children along the main axis.
  final JustifyContent justifyContent;

  ///* The alignment of the children along the cross axis.
  final AlignItems alignItems;

  ///* The alignment of the text.
  final TextAlign textAlign;

  //* The children to align.
  final List<Component> children;

  //* The space between each child, defaults to 8px.
  final Unit? space;

  //* The margin around the children, defaults to 0px
  /// [All]: '8px'
  /// [Vertical and Horizontal]: '8px 16px'
  /// [top, right, bottom, left]: '8px 16px 24px 32px'.
  final String margin;

  const Column({
    super.key,
    this.space,
    this.margin = '0px',
    this.textAlign = TextAlign.left,
    this.alignItems = AlignItems.center,
    this.justifyContent = JustifyContent.left,
    required this.id,
    required this.children,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_column_$id';

    yield Style(styles: [
      css('.$internal').raw({
        'width': '100%',
        'height': '100%',
        'display': 'flex',
        'flex-direction': 'column',
        'margin': margin,
        'text-align': textAlign.value,
        'justify-content': justifyContent.value,
        'align-items': alignItems.value,
      }),
    ]);

    final childrenWithSpacing = children.fold<List<Component>>(
      <Component>[],
      (children, combined) => [
        ...children,
        if (children.isNotEmpty)
          HorizontalGap(
            id: 'jaspr_ui_horizontal_gap_$id',
            gap: space ?? 8.px,
          ),
        combined,
      ],
    );

    yield div(childrenWithSpacing, classes: internal, id: id);
  }
}
