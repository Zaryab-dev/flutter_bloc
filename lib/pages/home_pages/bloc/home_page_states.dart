class HomePageStates {
  int index;

  HomePageStates({this.index = 0});

  HomePageStates copyWith({required int index}) {
    return HomePageStates(index: index);
  }
}



