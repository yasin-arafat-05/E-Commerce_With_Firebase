class AssectImages {
  //create instance of the class-> AssectImages
  static AssectImages instance = AssectImages();

  // all the image folder path
  static const String _imagesPath = "asset/images";

  //------------------------image name-------------------
  final String welcomeImage = "$_imagesPath/welcome.png";
  final String googleLogo = "$_imagesPath/googleLogo.png";
  final String blingLogo = "$_imagesPath/blink.png";
}
