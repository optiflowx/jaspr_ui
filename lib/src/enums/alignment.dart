enum MainAxisAlignment {
  start('start'),
  end('end'),
  center('center'),
  spaceBetween('space-between'),
  spaceAround('space-around'),
  spaceEvenly('space-evenly');

  final String value;

  const MainAxisAlignment(this.value);
}

enum CrossAxisAlignment {
  start('start'),
  end('end'),
  center('center'),
  stretch('stretch'),
  baseline('baseline');

  final String value;

  const CrossAxisAlignment(this.value);
}
