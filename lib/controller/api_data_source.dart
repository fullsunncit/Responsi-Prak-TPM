import '../service/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadHomePage() {
    return BaseNetwork.get("agents");
  }

  Future<Map<String, dynamic>> loadDetail(String uuid){
    return BaseNetwork.get("agents/" + uuid);
  }
}