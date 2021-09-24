Images images = Images();

class Images {
  static final Images _images = Images._i();

  factory Images() {
    return _images;
  }

  Images._i();

  ///
  static const String assetDir = "assets";
  // static const String iconDir = "assets/icons";
  static const String imageDir = "assets/images";

  final String ic_logo = "$imageDir/logo.jpeg";
  final String ic_logo_icon = "$imageDir/logo_icon.png";
  final String ic_ = "";
}
