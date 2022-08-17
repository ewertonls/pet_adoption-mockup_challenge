extension CalendarDuration on Duration {
  int get inMonths => inDays ~/ 30;
  double get inYears => inDays / 365;
}
