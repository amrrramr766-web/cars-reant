class LinkApi {
  static const String baseUrl = "http://example.com";
  static const String getCarById = "$baseUrl/car/";
}

class Crud {
  Future<dynamic> getData(String url) async {}
}

class Remote {
  final Crud crud;
  Remote(this.crud);

  Future<void> getCarById(int id) async {
    await crud.getData("${LinkApi.getCarById}$id");
  }

  Future<void> getCarByIdNullable(int? id) async {
    // This should fail if passed to something expecting int
    // await crud.getData("${LinkApi.getCarById}$id"); // This is fine for string
  }
}

void main() {
  print("Hello");
}
