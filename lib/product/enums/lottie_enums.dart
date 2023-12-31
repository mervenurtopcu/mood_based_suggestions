enum LottieItems {
  //TODO: Add lottie json file and write the name here
  login,
  emptyCart,
  loading,
}

extension LottieExtension on LottieItems {
  //TODO: Define the path of the lottie json file and write in the switch case
  String _path() {
    switch (this) {
      case LottieItems.login:
        return 'lottie_login';
      case LottieItems.emptyCart:
        return 'lottie_empty_cart';
      case LottieItems.loading:
        return 'lottie_loading';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}