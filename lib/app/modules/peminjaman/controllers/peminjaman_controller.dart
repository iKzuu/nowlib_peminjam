import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_pinjam.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{
  // int selectedIndex = 2;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  // void changePage(int index) {
  //   selectedIndex = index;
  //   update();
  //   switch (index) {
  //     case 0:
  //       Get.offAllNamed(Routes.HOME);
  //       break;
  //     case 1:
  //       Get.offAllNamed(Routes.KOLEKSI);
  //       break;
  //     case 2:
  //       Get.offAllNamed(Routes.PEMINJAMAN);
  //       break;
  //   }
  // }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance()
          .get("${Endpoint.pinjam}/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) { // Change status code to 200
        final ResponsePinjam responsePinjam =
        ResponsePinjam.fromJson(response.data);
        if (responsePinjam.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responsePinjam.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("${response.data['message']}"));
      }
    } on DioError catch (e) { // Change to DioError
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


  // getData() async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await ApiProvider.instance().get("${Endpoint.pinjam}/${StorageProvider.read(StorageKey.idUser)}");
  //     if (response.statusCode == 201) {
  //       final ResponsePinjam responsePinjam = ResponsePinjam.fromJson(response.data);
  //       if(responsePinjam.data!.isEmpty) {
  //         change(null, status: RxStatus.empty());
  //       } else {
  //         List<DataPinjam> dataPinjam = responsePinjam.data!;
  //         List<DataPinjam> filteredData = dataPinjam.where((item) => item.userID == StorageProvider.read(StorageKey.idUser)).toList();
  //         if(filteredData.isEmpty) {
  //           change(null, status: RxStatus.empty());
  //         } else {
  //           change(filteredData, status: RxStatus.success());
  //         }
  //       }
  //     } else {
  //       change(null, status: RxStatus.error("${response.data['Message']}"));
  //     }
  //   } on DioException catch (e){
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null, status: RxStatus.error("${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error(e.message ?? ""));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error(e.toString()));
  //   }
  // }


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
