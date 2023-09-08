abstract class ApplicationEvents {
  const ApplicationEvents();
}

class TriggerAppEvent extends ApplicationEvents {
  final int index;

  const TriggerAppEvent(this.index) : super();
}
