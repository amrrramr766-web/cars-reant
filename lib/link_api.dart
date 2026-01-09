class LinkApi {
  // static const String baseUrl = "http://0.0.0.0:5267/api";
  static const String baseUrl = "http://192.168.1.6:5267/api";

  // Users
  static const String login = "$baseUrl/users/Login";
  static const String register = "$baseUrl/users/Register";
  static const String userinfo = "$baseUrl/users/"; // GET + id => Get user info
  static const String userLicense =
      "$baseUrl/users/"; // GET + id => Get user license info

  // Cars
  static String getCars() {
    return "$baseUrl/car/search"; // فقط الرابط، البيانات سترسل في body عند POST
  }

  static const String getCarById = "$baseUrl/car/"; // GET + id => Get car by Id
  static const String addCar = "$baseUrl/car"; // POST => Add new car
  static const String updateCar = "$baseUrl/car/"; // PUT + id => Update car
  static const String deleteCar = "$baseUrl/car/"; // DELETE + id => Delete car

  static const String getReviwe = "$baseUrl/Reviwe"; // GET => Get all cars
  static const String getReviweByCarId =
      "$baseUrl/Reviwe/car/"; // GET => Get all cars
  static const String updateReviwe = "$baseUrl/Reviwe/"; // GET => Get all cars
  static const String deleteReviwe = "$baseUrl/Reviwe/"; // GET => Get all cars

  static const String getAllBooking = "$baseUrl/Booking";
  static const String addBooking = "$baseUrl/Booking";
  static const String getBookingsByUser = "$baseUrl/Booking/GetByUser";

  static const String getBookingById =
      "$baseUrl/Booking/"; // GET => Get all cars

  static const String getOffers = "$baseUrl/offers"; // GET => Get all offers

  static const String getSuggestions =
      "$baseUrl/car/suggestions/all"; // GET => Get all suggestions

  static const String search =
      "$baseUrl/car/search"; // POST => Send search query

  // Favorites
  static const String getFavoritesByUser = "$baseUrl/fave/list?userId=";
  static const String toggleFavorite = "$baseUrl/fave/toggle";
  static const String deleteFavorite = "$baseUrl/fave/remove?faveid=";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
