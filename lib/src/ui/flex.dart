import 'package:jaspr/browser.dart';
import 'package:jaspr_ui/jaspr_ui.dart';

// This is a simple component that aligns its children vertically.
class FlexBox extends StatelessComponent {
  ///* The id is required.
  //! The id  must be unique to avoid css conflicts.
  final String id;

  //* The alignment of the children along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  //* The alignment of the children along the main axis.
  final MainAxisAlignment mainAxisAlignment;

  //* The children to align.
  final List<Component> children;

  //* The direction of the children.
  final FlexDirection direction;

  //* The space between each child, defaults to 8px.
  final Unit? space;

    //* The margin around the children, defaults to 0px
  /// [All]: '8px' 
  /// [Vertical and Horizontal]: '8px 16px'
  /// [top, right, bottom, left]: '8px 16px 24px 32px'.
  final String margin;


  FlexBox({
    super.key,
    this.space,
    this.margin = '0',
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.id,
    required this.direction,
    required this.children,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final isColumn = direction == FlexDirection.column;
    final internal = 'jaspr_ui_flex_${key.hashCode}';

    yield Style(styles: [
      css('.$internal').raw({
        'width': '100%',
        'display': 'flex',
        'margin': margin,
        'flex-direction': direction.value,
        'justify-content':
            isColumn ? mainAxisAlignment.value : crossAxisAlignment.value,
        'align-items':
            isColumn ? crossAxisAlignment.value : mainAxisAlignment.value,
      }),
    ]);

    final childrenWithSpacing = children.fold<List<Component>>(
      <Component>[],
      (children, combined) => [
        ...children,
        if (children.isNotEmpty)
          if (isColumn)
            HorizontalGap(
              id: 'jaspr_ui_horizontal_gap_${combined.hashCode}',
              gap: space ?? 8.px,
            )
          else
            VerticalGap(
              id: 'jaspr_ui_vertical_gap_${combined.hashCode}',
              gap: space ?? 8.px,
            ),
        combined,
      ],
    );

    yield div(childrenWithSpacing, classes: internal, id: id);
  }
}
