// student_list_page.dart
import 'package:flutter/material.dart';
import 'data/library_data.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  void _showStudentDetails(Student student) {
    final borrowedBooks = MockData.getStudentBooks(student.id);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chi tiết sinh viên'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Họ tên: ${student.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Mã SV: ${student.id}'),
            Text('Số sách đang mượn: ${borrowedBooks.length}'),
            if (borrowedBooks.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text('Danh sách sách:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...borrowedBooks.map((book) => Text('• ${book.title}')),
            ],
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
        title: Text('Danh sách Sinh viên', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Tổng số: ${MockData.students.length} sinh viên',
                 style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17)
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: MockData.students.length,
                itemBuilder: (context, index) {
                  final student = MockData.students[index];
                  final borrowedCount = student.borrowedBooks.length;
                  
                  return GestureDetector(
                    onTap: () => _showStudentDetails(student),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, color: Colors.black),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(student.name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                                Text('${student.id} - $borrowedCount sách đang mượn',
                                     style: const TextStyle(color: Colors.black, fontSize: 12)),
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