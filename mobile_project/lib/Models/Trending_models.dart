// ignore_for_file: file_names, non_constant_identifier_names, camel_case_types

class trend_models{
  static String Popular = "Popular";
  static String Newest = "Newest";
  static String Reccommended = "Reccommended";
  static String Promo = "Promo";

  static List<String> all(){
    return [Popular, Newest, Reccommended, Promo];
  }
}