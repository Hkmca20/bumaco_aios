final String imageAssetsRoot = "assets/images/";
final String mask5 = _getImagePath("mask_group_5.png");
final String mask6 = _getImagePath("mask_group_6.png");
final String mask7 = _getImagePath("mask_group_7.png");
final String mask8 = _getImagePath("mask_group_8.png");
final String tshirt1 = _getImagePath("men_t_shirt_1.jpeg");
final String logoPath = _getImagePath("app_logo.png");
final String bg1 = _getImagePath("bg_1.jpg");
final String bg2 = _getImagePath("bg_2.jpg");
final String bg3 = _getImagePath("bg_3.jpg");
final String bg4 = _getImagePath("bg4.jpg");

final String riveAssetRoot = 'assets/rive/';
final String basketballRive = _getRivePath('basketball.riv');
final String downloadRive = _getRivePath('download_icon.riv');
final String vehiclesRive = _getRivePath('vehicles.riv');

String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}
String _getRivePath(String fileName) {
  return riveAssetRoot + fileName;
}
