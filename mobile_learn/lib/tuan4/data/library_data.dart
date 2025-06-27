class Student {
  final String id;
  final String name;
  final List<String> borrowedBooks;

  Student({required this.id, required this.name, required this.borrowedBooks});
}

class Book {
  final String id;
  final String title;
  final String author;
  final bool isAvailable;
  final String? borrowedBy;

  Book({required this.id, required this.title, required this.author, 
        this.isAvailable = true, this.borrowedBy});
}

class MockData {
  static List<Student> students = [
    Student(id: 'SV001', name: 'Nguyen Van A', borrowedBooks: ['BOOK001', 'BOOK002']),
    Student(id: 'SV002', name: 'Nguyen Thi B', borrowedBooks: ['BOOK003']),
    Student(id: 'SV003', name: 'Nguyen Van C', borrowedBooks: []),
    Student(id: 'SV004', name: 'Le Thi D', borrowedBooks: ['BOOK004', 'BOOK005']),
    Student(id: 'SV005', name: 'Tran Van E', borrowedBooks: ['BOOK006']),
  ];

  static List<Book> books = [
    Book(id: 'BOOK001', title: 'Flutter Programming', author: 'Author A', isAvailable: false, borrowedBy: 'SV001'),
    Book(id: 'BOOK002', title: 'Java Basics', author: 'Author B', isAvailable: false, borrowedBy: 'SV001'),
    Book(id: 'BOOK003', title: 'Python Guide', author: 'Author C', isAvailable: false, borrowedBy: 'SV002'),
    Book(id: 'BOOK004', title: 'Database Design', author: 'Author D', isAvailable: false, borrowedBy: 'SV004'),
    Book(id: 'BOOK005', title: 'Network Systems', author: 'Author E', isAvailable: false, borrowedBy: 'SV004'),
    Book(id: 'BOOK006', title: 'Operating Systems', author: 'Author F', isAvailable: false, borrowedBy: 'SV005'),
    Book(id: 'BOOK007', title: 'Web Development', author: 'Author G'),
    Book(id: 'BOOK008', title: 'Mobile Apps', author: 'Author H'),
    Book(id: 'BOOK009', title: 'Data Structures', author: 'Author I'),
    Book(id: 'BOOK010', title: 'Algorithms', author: 'Author J'),
  ];

  static Student? getStudent(String id) => 
      students.where((s) => s.id == id).isNotEmpty ? students.firstWhere((s) => s.id == id) : null;
  
  static Book? getBook(String id) => 
      books.where((b) => b.id == id).isNotEmpty ? books.firstWhere((b) => b.id == id) : null;
  
  static List<Book> getStudentBooks(String studentId) {
    final student = getStudent(studentId);
    return student?.borrowedBooks.map((id) => getBook(id)!).toList() ?? [];
  }
}