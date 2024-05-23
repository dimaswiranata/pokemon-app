class Location {
  final int id;
  final String title;
  bool status;

  Location({required this.id, required this.title, this.status = false});
}

List<Location> locationList() {
  return [
    // Location(id: 0, title: "All"),
    Location(id: 1, title: "Bali"),
    Location(id: 2, title: "Bandung"),
    Location(id: 3, title: "Batam"),
    Location(id: 4, title: "Bekasi"),
    Location(id: 5, title: "Bogor"),
    Location(id: 6, title: "Jakarta"),
    Location(id: 7, title: "Makassar"),
    Location(id: 8, title: "Manado"),
    Location(id: 9, title: "Medan"),
    Location(id: 10, title: "Palembang"),
  ];
}
