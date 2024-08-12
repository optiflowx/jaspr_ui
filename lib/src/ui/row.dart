import 'package:jaspr/browser.dart';

import '../../jaspr_ui.dart';

// This is a simple component that aligns its children horizontally.
class Row extends StatelessComponent {
  ///* The id is required.
  //! The id  must be unique to avoid css conflicts.
  final String id;

  //* The alignment of the children along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  //* The alignment of the children along the main axis.
  final MainAxisAlignment mainAxisAlignment;

  //* The children to align.
  final List<Component> children;

  //* The space between each child, defaults to 8px.
  final Unit? space;

  //* The margin around the children, defaults to 0px
  /// [All]: '8px'
  /// [Vertical and Horizontal]: '8px 16px'
  /// [top, right, bottom, left]: '8px 16px 24px 32px'.
  final String margin;

  const Row({
    super.key,
    this.space,
    this.margin = '0px',
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.id,
    required this.children,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final internal = 'jaspr_ui_row_${key.hashCode}';

    yield Style(styles: [
      css('.$internal').raw({
        'width': '100%',
        'height': '100%',
        'display': 'flex',
        'margin': margin,
        'overflow': 'hidden',
        'flex-wrap': 'nowrap',
        'flex-direction': 'row',
        'justify-content': mainAxisAlignment.value,
        'align-items': crossAxisAlignment.value,
      }),
    ]);

    final childrenWithSpacing = children.fold<List<Component>>(
      <Component>[],
      (children, combined) => [
        ...children,
        if (children.isNotEmpty) VerticalGap(
          gap: space ?? 8.px,
          id: 'gap_${combined.hashCode}',
        ),
        combined,
      ],
    );

    yield div(childrenWithSpacing, classes: internal, id: id);
  }
}
