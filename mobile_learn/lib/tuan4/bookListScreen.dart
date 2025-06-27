// book_list_page.dart
import 'package:flutter/material.dart';
import 'data/library_data.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  void _showBookDetails(Book book) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chi tiết sách'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tên sách: ${book.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Tác giả: ${book.author}'),
            Text('Mã sách: ${book.id}'),
            Text('Trạng thái: ${book.isAvailable ? "Có sẵn" : "Đã mượn"}'),
            if (!book.isAvailable && book.borrowedBy != null)
              Text('Được mượn bởi: ${MockData.getStudent(book.borrowedBy!)?.name ?? "N/A"}'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đóng')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Danh sách Sách', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Tổng số: ${MockData.books.length} cuốn sách',
                 style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17)
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: MockData.books.length,
                itemBuilder: (context, index) {
                  final book = MockData.books[index];
                  return GestureDetector(
                    onTap: () => _showBookDetails(book),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(book.title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize:17)),
                                Text('${book.author} - ${book.isAvailable ? "Có sẵn" : "Đã mượn"}',
                                     style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}