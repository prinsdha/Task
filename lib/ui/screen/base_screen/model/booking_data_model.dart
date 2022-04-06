class BookingDataModel {
  BookingDataModel({
    required this.currentBookings,
    required this.packages,
  });

  CurrentBookings currentBookings;
  List<Package> packages;

  factory BookingDataModel.fromJson(Map<String, dynamic> json) =>
      BookingDataModel(
        currentBookings: CurrentBookings.fromJson(json["current_bookings"]),
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );
}

class CurrentBookings {
  CurrentBookings({
    required this.packageLabel,
    required this.fromDate,
    required this.fromTime,
    required this.toDate,
    required this.toTime,
  });

  String packageLabel;
  String fromDate;
  String fromTime;
  String toDate;
  String toTime;

  factory CurrentBookings.fromJson(Map<String, dynamic> json) =>
      CurrentBookings(
        packageLabel: json["package_label"],
        fromDate: json["from_date"],
        fromTime: json["from_time"],
        toDate: json["to_date"],
        toTime: json["to_time"],
      );
}

class Package {
  Package({
    required this.id,
    required this.packageName,
    required this.price,
    required this.description,
  });

  int id;
  String packageName;
  int price;
  String description;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        packageName: json["package_name"],
        price: json["price"],
        description: json["description"],
      );
}
