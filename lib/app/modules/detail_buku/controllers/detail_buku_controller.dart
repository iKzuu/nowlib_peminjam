import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_detail.dart';
import '../../../data/provider/api_provider.dart';

class DetailBukuController extends GetxController with StateMixin<List<DataDetail>>{

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

  @override
  void onClose() {
    super.onClose();
  }



  Future<void> getData () async {
    change(null, status: RxStatus.loading());
    var idBuku = Get.parameters['id'];
    try {
      final response = await ApiProvider.instance().get("${Endpoint.buku}?id=$idBuku");
      if (response.statusCode == 200) {
        final ResponseDetail responseDetail = ResponseDetail.fromJson(response.data);
        if(responseDetail.data == null) {
          change(null, status: RxStatus.empty());
        }else if (responseDetail.data is List){
          change(responseDetail.data as List<DataDetail>?, status: RxStatus.success());
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

  void increment() => count.value++;
}

