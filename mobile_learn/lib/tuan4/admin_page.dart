import 'package:flutter/material.dart';
import 'data/library_data.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String? selectedStudentId;
  List<Book> borrowedBooks = [];

  void _onStudentChanged(String? studentId) {
    setState(() {
      selectedStudentId = studentId;
      borrowedBooks = MockData.getStudentBooks(studentId ?? '');
    });
  }

  void _showStudentSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chọn sinh viên'),
        content: SizedBox(
          width: 300,
          height: 300,
          child: ListView.builder(
            itemCount: MockData.students.length,
            itemBuilder: (context, index) {
              final student = MockData.students[index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text('Mã SV: ${student.id}'),
                onTap: () {
                  _onStudentChanged(student.id);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showAddBookDialog() {
    if (selectedStudentId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn sinh viên trước')),
      );
      return;
    }

    final availableBooks = MockData.books.where((book) => book.isAvailable).toList();
    
    if (availableBooks.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không còn sách nào để mượn')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm sách'),
        content: SizedBox(
          width: 300,
          height: 300,
          child: ListView.builder(
            itemCount: availableBooks.length,
            itemBuilder: (context, index) {
              final book = availableBooks[index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text('Tác giả: ${book.author}'),
                onTap: () {
                  setState(() {
                    if (!borrowedBooks.any((b) => b.id == book.id)) {
                       borrowedBooks.add(book);
                    }
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã thêm sách ${book.title}')),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Quản lý Thư viện', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedStudentId != null 
                        ? MockData.getStudent(selectedStudentId!)?.name ?? 'Chọn sinh viên'
                        : 'Chọn sinh viên',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                TextButton.icon(
                  onPressed: _showStudentSelectionDialog,
                  icon: const Icon(Icons.person, size: 20),
                  label: const Text('Thay đổi'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: selectedStudentId == null
                ? const Center(child: Text('Vui lòng chọn sinh viên'))
                : borrowedBooks.isEmpty
                    ? const Center(child: Text('Chưa mượn sách nào'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: borrowedBooks.length,
                        itemBuilder: (context, index) {
                          final book = borrowedBooks[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {
                                if (value == false) {
                                  setState(() {
                                    borrowedBooks.removeWhere((b) => b.id == book.id);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Đã trả sách ${book.title}')),
                                  );
                                }
                              },
                              title: Text(book.title),
                              subtitle: Text('Tác giả: ${book.author}'),
                              secondary: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: _showAddBookDialog,
                              ),
                            ),
                          );
                        },
                      ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: _showAddBookDialog,
              icon: const Icon(Icons.add),
              label: const Text('Thêm sách'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}