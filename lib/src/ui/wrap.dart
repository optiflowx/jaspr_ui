import 'package:jaspr/browser.dart';
import 'package:jaspr_ui/jaspr_ui.dart';

// This is a simple component that aligns its children either
// vertically or horizontally. It can be used to wrap a child.
class Wrap extends StatelessComponent {
    ///* The id is required.
  //! The id  must be unique to avoid css conflicts.
  final String id;

  //* The alignment of the children along the cross axis.
  final JustifyContent justifyContent;

  //* The alignment of the children along the main axis.
  final AlignItems alignItems;

  //* The children to align.
  final List<Component> children;

  //* The direction of the children.
  /// This can be either a row or a column.
  ///
  final FlexDirection direction;

  //* The space between each child, defaults to 8px.
  final Unit? space;

  //* The margin around the children, defaults to 0.
  /// This can be a single value or a shorthand value.
  /// For example, '8px' or '8px 16px' or '8px 16px 24px 32px'.
  final String margin;

  //* The margin around the children, defaults to 0.
  /// This can be a single value or a shorthand value.
  /// For example, '8px' or '8px 16px' or '8px 16px 24px 32px'.
  final String padding;

  //* The space between each child, defaults to 8px.
  final FlexWrap wrap;

    ///* The alignment of the text.
  // final TextAlign textAlign;

  Wrap({
    super.key,
    this.space,
    this.padding = '0',
    this.margin = '0',
    // this.textAlign = TextAlign.start,
    this.wrap = FlexWrap.wrap,
    this.alignItems = AlignItems.start,
    this.justifyContent = JustifyContent.center,
    this.direction = FlexDirection.row,
    required this.id,
    required this.children,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final isColumn = direction == FlexDirection.column;

    final internal = 'jaspr_ui_wrap_$id';

    yield Style(styles: [
      css('.$internal').raw({
        'width': '100%',
        'height': '100%',
        'display': 'flex',
        'margin': margin,
        'padding': padding,
        'flex-wrap': wrap.value,
        // 'text-align': textAlign.value,
        'flex-direction': direction.value,
        'justify-content': isColumn ? alignItems.value : justifyContent.value,
        'align-items': isColumn ? justifyContent.value : alignItems.value,
      }),
    ]);

    final childrenWithSpacing = children.fold<List<Component>>(
      <Component>[],
      (children, combined) => [
        ...children,
        if (children.isNotEmpty)
          if (isColumn)
            HorizontalGap(
              id: 'jaspr_ui_horizontal_gap_$id',
              gap: space ?? 8.px,
            )
          else
            VerticalGap(
              id: 'jaspr_ui_vertical_gap_$id',
              gap: space ?? 8.px,
            ),
        combined,
      ],
    );

    yield div(childrenWithSpacing, classes: internal, id: id);
  }
}
