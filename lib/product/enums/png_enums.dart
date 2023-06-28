enum PngConstants {
  logo('ic_logo'),
  logo_rounded('ic_logo_rounded'),
  ;

  final String value;

   const PngConstants(this.value);

  String get toPng => 'assets/png/$value.png';
}