abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent{
  int index;

  HomePageDots( this.index);
}
