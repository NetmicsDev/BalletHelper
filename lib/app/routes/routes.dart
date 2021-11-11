abstract class Routes {
  static const String home = '/';
  static const String detail = '/detail/:id';
  static const String setting = '/setting';
  static String getDetail({required id}) => '/detail/$id';
}
