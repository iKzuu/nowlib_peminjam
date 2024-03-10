import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_buku.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<List<DataBuku>> {
  final RxInt count = 0.obs;
  final RxList<DataBuku> dataList = <DataBuku>[].obs;
  final RxList<DataBuku> filteredData = <DataBuku>[].obs; // Tambahkan filteredData
  TextEditingController searchController = TextEditingController();
  final RxBool isFiltering = false.obs;

  @override
  void onInit() {
    super.onInit();
    filteredData.assignAll(dataList); // Menggunakan dataList langsung tanpa controller
    searchController.addListener(() {
      filterData(searchController.text);
    });
    getData();
  }

  void filterData(String query) {
    if (query.isEmpty) {
      isFiltering.value = false;
      filteredData.assignAll(dataList);
    } else {
      isFiltering.value = true;
      filteredData.assignAll(dataList.where((data) =>
          (data.judul?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (data.penulis?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (data.penerbit?.toLowerCase().contains(query.toLowerCase()) ?? false),
      ));
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



  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.buku);
      if (response.statusCode == 200) {
        final ResponseBuku responseBuku = ResponseBuku.fromJson(response.data);
        if (responseBuku.data != null && responseBuku.data!.isNotEmpty) {
          dataList.assignAll(responseBuku.data!);
          filteredData.assignAll(responseBuku.data!); // Tambahkan filteredData
          change(dataList, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("Failed to fetch data"));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final dynamic responseData = e.response!.data;
        if (responseData != null && responseData['message'] != null) {
          change(null, status: RxStatus.error(responseData['message']));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void increment() => count.value++;
}

