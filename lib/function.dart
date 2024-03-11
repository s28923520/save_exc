import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
import 'package:excel/excel.dart';

void exportexcel(BuildContext context, List<List<String>> dataf) async {
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  //手機路徑
  var path = "/storage/emulated/0/Download/project.xlsx";

  for (var row in dataf) {
    sheet.appendRow(row);
  }
  try {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String filePath = p.join(documentsDirectory.path, 'project.xlsx');

    var excelFile = await excel.encode();
    // File(filePath).writeAsBytesSync(excelFile!);
    File(path).writeAsBytesSync(excelFile!);

    // print('存儲至$filePath');
    print('存儲至$path');
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('存儲'),
          content: Text('已存儲至$path'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('確認'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    print('Error exporting to Excel: $e');
  }
}
