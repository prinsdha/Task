import 'package:nannyvanny/ui/screen/base_screen/model/booking_data_model.dart';

abstract class ApiClient {
  Future<BookingDataModel> getData();
}
