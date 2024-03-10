import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_buku.dart';
import '../../../data/provider/api_provider.dart';

class DetailBukuController extends GetxController {

  List<DataBuku> listDataBuku = [];

  final count = 0.obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  DataBuku? findBukuById(String? bookID) {
    // Contoh implementasi sederhana, ganti dengan logika pencarian sesuai dengan kebutuhan Anda
    return listDataBuku.firstWhere((buku) => buku.bookID == int.parse(bookID ?? ''), orElse: () => DataBuku());
  }

  void fetchData() async {
    var response = await ApiProvider.instance().get(Endpoint.buku);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.data);
      var responseData = ResponseBuku.fromJson(jsonResponse);
      listDataBuku = responseData.data ?? [];
      update();
    } else {
      // Handle error response
    }
  }

  void increment() => count.value++;
}

