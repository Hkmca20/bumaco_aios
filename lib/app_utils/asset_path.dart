final String imageAssetsRoot = "assets/images/";
final String img_mask5 = _getImagePath("mask_group_5.png");
final String img_mask6 = _getImagePath("mask_group_6.png");
final String img_mask7 = _getImagePath("mask_group_7.png");
final String img_mask8 = _getImagePath("mask_group_8.png");
final String img_tshirt1 = _getImagePath("men_t_shirt_1.jpeg");
final String iconGoogle = _getImagePath("ic_google.png");
final String iconFacebook = _getImagePath("ic_facebook.png");
final String imgGoogle = _getImagePath("img_google.jpg");
final String logoPath = _getImagePath("logo512.png");
final String logo100Path = _getImagePath("logo100.png");
final String logo24Path = _getImagePath("logo24.png");
final String logo32Path = _getImagePath("logo32.png");
final String bg1 = _getImagePath("bg_1.jpg");
final String bg2 = _getImagePath("bg_2.jpg");
final String bg3 = _getImagePath("bg_3.jpg");
final String bg4 = _getImagePath("bg4.jpg");
final String img_splash = _getImagePath("img_splash.jpg");
final String onboard_1 = _getImagePath("onboard_1.png");
final String onboard_2 = _getImagePath("onboard_2.png");
final String onboard_3 = _getImagePath("onboard_3.png");
final String onboard_4 = _getImagePath("onboard_4.png");
final String onboard_5 = _getImagePath("onboard_5.png");
final String onboard_1c = _getImagePath("onboard_1c.png");
final String onboard_2c = _getImagePath("onboard_2c.png");
final String onboard_3c = _getImagePath("onboard_3c.png");
final String onboard_4c = _getImagePath("onboard_4c.png");
final String onboard_5c = _getImagePath("onboard_5c.png");
final String happyEmoji = _getRivePath('happiness_emoji.flr');

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
