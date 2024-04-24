import 'dart:io';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_detail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:pdf/widgets.dart' show PdfGoogleFonts;

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_peminjaman.dart';
import '../../../data/provider/api_provider.dart';

class NotaController extends GetxController with StateMixin<DataDetail>{
  final loading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
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

  // Future<void> createInvoicePDF() async {
  //   final pdf = pdfWidgets.Document();
  //   final font = await PdfGoogleFonts.openFile('assets/font/nota.ttf');
  //
  //   pdf.addPage(
  //     pdfWidgets.Page(
  //       build: (context) {
  //         return pdfWidgets.Container(
  //           margin: pdfWidgets.EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
  //           child: pdfWidgets.Column(
  //             children: [
  //               pdfWidgets.Row(
  //                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   pdfWidgets.Text('InvoiceID : ', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                   pdfWidgets.Text(Get.parameters['InvoiceID'] ?? '', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                 ],
  //               ),
  //               pdfWidgets.SizedBox(height: 30),
  //               pdfWidgets.Row(
  //                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   pdfWidgets.Text('Judul : ', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                   pdfWidgets.Text(Get.parameters['Judul'] ?? '', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                 ],
  //               ),
  //               pdfWidgets.SizedBox(height: 30),
  //               pdfWidgets.Row(
  //                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   pdfWidgets.Text('Nama Peminjam : ', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                   pdfWidgets.Text(Get.parameters['Namalengkap'] ?? '', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                 ],
  //               ),
  //               pdfWidgets.SizedBox(height: 30),
  //               pdfWidgets.Row(
  //                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   pdfWidgets.Text('Tanggal Pinjam : ', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                   pdfWidgets.Text(Get.parameters['TglPeminjaman'] ?? '', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                 ],
  //               ),
  //               pdfWidgets.SizedBox(height: 30),
  //               pdfWidgets.Row(
  //                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   pdfWidgets.Text('Tanggal Kembali : ', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                   pdfWidgets.Text(Get.parameters['TglPengembalian'] ?? '', style: pdfWidgets.TextStyle(fontSize: 14)),
  //                 ],
  //               ),
  //               pdfWidgets.SizedBox(height: 50),
  //               pdfWidgets.Flexible(
  //                 child: pdfWidgets.Text(
  //                   '*tunjukkan invoice pada petugas perpustakaan saat pengambilan buku',
  //                   style: pdfWidgets.TextStyle(fontSize: 12, color: PdfColors.grey),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  //
  //   // Dapatkan path direktori penyimpanan dokumen
  //   final downloadsDirectory = await getExternalStorageDirectory();
  //   final downloadsPath = downloadsDirectory!.path;
  //
  //   // Simpan file PDF ke direktori Downloads
  //   final file = File('$downloadsPath/invoice.pdf');
  //   await file.writeAsBytes(await pdf.save());
  // }

  void increment() => count.value++;
}
