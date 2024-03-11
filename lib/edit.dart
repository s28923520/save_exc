import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'function.dart';

class Editform extends StatefulWidget {
  const Editform({super.key});

  @override
  State<Editform> createState() => _EditformState();
}

class _EditformState extends State<Editform> {
  List<List<String>> dataf = [
    ['角色', '認領人'],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() { // 新增一列
                    dataf.add(List.filled(dataf[0].length, ''));
                  });
                },
                child: Text('新增角色'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {// 新增一行
                    dataf.forEach((row) => row.add(''));
                  });
                },
                child: Text('新增認領人'),
              ),
            ],
          ),
          DataTable(
            columns: List.generate(
              dataf[0].length,
              (index) => DataColumn(
                  label: Text(
                      '第${String.fromCharCode('1'.codeUnitAt(0) + index)}列')),
            ),
            rows: List.generate(
              dataf.length,
              (rowIndex) {
                return DataRow(
                  cells: List.generate(
                    dataf[rowIndex].length,
                    (colIndex) {
                      return DataCell(
                        TextFormField(
                          initialValue: dataf[rowIndex][colIndex],
                          onChanged: (value) {
                            // 修改資料
                            setState(() {
                              dataf[rowIndex][colIndex] = value;
                            });
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {// 刪除最後一列
                    if (dataf.isNotEmpty) {
                      dataf.removeLast();
                    }
                  });
                },
                child: Text('刪除角色'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {// 刪除最後一行
                    if (dataf.isNotEmpty) {
                      dataf.forEach((row) {
                        row.removeLast();
                      });
                    }
                  });
                },
                child: Text('刪除認領人'),
              ),
            ],
          ),
          ElevatedButton(
                onPressed: () {
                  exportexcel(context, dataf);
                },
                child: Text('儲存excel'),
              ),
        ],
      ),
    );
  }
}