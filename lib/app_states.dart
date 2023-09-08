

class AppState{

  int counter;
  AppState({required this.counter});

}

class initState extends AppState{
  initState() : super(counter: -5);

}