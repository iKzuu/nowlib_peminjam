import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_peminjaman.dart';
import 'package:nowlib_peminjam/app/data/model/response_pinjam.dart';
import 'package:nowlib_peminjam/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class NotaRiwayatController extends GetxController with StateMixin<DataPeminjaman>{
  final id = Get.parameters['id'];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData(id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getData (String? idPinjam) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.peminjaman,
          queryParameters: {'id' : idPinjam});
      if (response.statusCode == 201) {
        final ResponsePeminjaman responsePeminjaman = ResponsePeminjaman.fromJson(response.data);
        if(responsePeminjaman.data == null) {
          change(null, status: RxStatus.empty());
        }else {
          change(responsePeminjaman.data, status: RxStatus.success());
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
