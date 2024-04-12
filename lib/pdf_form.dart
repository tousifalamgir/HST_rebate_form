import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:share_plus/share_plus.dart';

class PdfApi {
  static Future<File> generateCenteredText(String text) async {
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(text, style: TextStyle(fontSize: 48)),
      )
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    print('This the path  ${dir.path}/$name');
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    sharePdfFile(file.path);
    print(file);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    print('url ${url}');
    sharePdfFile(url);

    await OpenFile.open(url);
  }

  static void sharePdfFile(String filePath) {
    final List<XFile> files = [XFile(filePath)];
    Share.shareXFiles(files, text: 'my_example.pdf');
  }
}
