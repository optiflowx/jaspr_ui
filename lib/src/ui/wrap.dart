import 'package:jaspr/browser.dart';
import 'package:jaspr_ui/jaspr_ui.dart';

// This is a simple component that aligns its children either
// vertically or horizontally. It can be used to wrap a child.
class Wrap extends StatelessComponent {
  //* The alignment of the children along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  //* The alignment of the children along the main axis.
  final MainAxisAlignment mainAxisAlignment;

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

  Wrap({
    super.key,
    this.space,
    this.padding = '0',
    this.margin = '0',
    this.wrap = FlexWrap.wrap,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.direction = FlexDirection.row,
    required this.children,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final isColumn = direction == FlexDirection.column;

    yield Style(styles: [
      css('.jaspr_ui_wrap').raw({
        'width': '100%',
        'height': '100%',
        'display': 'flex',
        'margin': margin,
        'padding': padding,
        'flex-wrap': wrap.value,
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

    yield div(childrenWithSpacing, classes: 'jaspr_ui_wrap');
  }
}
