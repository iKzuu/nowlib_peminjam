import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_pinjam.dart';
import '../../../data/provider/api_provider.dart';

class DataPeminjamanController extends GetxController with StateMixin<List<DataPinjam>> {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getData () async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.pinjem);
      if (response.statusCode == 201) {
        final ResponsePinjam responsePinjam = ResponsePinjam.fromJson(response.data);
        if(responsePinjam.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        }else{
          change(responsePinjam.data, status: RxStatus.success());
        }
      }else{
        change(null, status: RxStatus.error("gagal mengambil data"));
      }

    }on DioException catch (e){
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      }else{
        change(null, status: RxStatus.error(e.message ?? ""));

      }
    }catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
