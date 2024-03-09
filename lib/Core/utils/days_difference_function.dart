int dayDifference() {
  DateTime givenDate = DateTime.now();
  DateTime firstDayOfYear = DateTime(DateTime.now().year, 1, 1);
  return givenDate.difference(firstDayOfYear).inDays;
}
