enum PngConstants {
  avatar('ic_avatar'),
  carrot('ic_carrot'),
  vegetables('ic_vegetables'),
  ;

  final String value;

  const PngConstants(this.value);

  String get toPng => 'assets/$value.png';
}