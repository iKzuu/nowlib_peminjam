import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_koleksi.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class KoleksiController extends GetxController with StateMixin<List<DataKoleksi>>{

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance()
          .get("${Endpoint.getkol}/?userId=${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 201) { // Change status code to 200
        final ResponseKoleksi responseKoleksi =
        ResponseKoleksi.fromJson(response.data);
        if (responseKoleksi.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseKoleksi.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("${response.data['message']}"));
      }
    } on dio.DioError catch (e) { // Change to DioError
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
