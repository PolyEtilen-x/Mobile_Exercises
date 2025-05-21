import 'package:flutter/material.dart';

class Practice01Screen extends StatefulWidget {
  const Practice01Screen({Key? key}) : super(key: key);

  @override
  State<Practice01Screen> createState() => _Practice01ScreenState();
}

class _Practice01ScreenState extends State<Practice01Screen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String? _result;

  String classifyAge(int age) => age > 65
      ? 'Người già (>65)'
      : age >= 6
          ? 'Người lớn (6-65)'
          : age >= 2
              ? 'Trẻ em (2-6)'
              : 'Em bé (<2)';

  void _check() {
    final name = _nameController.text.trim();
    final age = int.tryParse(_ageController.text.trim());

    setState(() {
      _result = name.isEmpty || age == null || age < 0
          ? (name.isEmpty || _ageController.text.trim().isEmpty
              ? 'Vui lòng nhập đầy đủ thông tin.'
              : 'Tuổi không hợp lệ!')
          : 'Họ tên: $name\nTuổi: $age\nPhân loại: ${classifyAge(age)}';
    });
  }

  Widget _buildInputRow(String label, TextEditingController controller, {bool isNumber = false}) {
    return Row(
      children: [
        SizedBox(width: 80, child: Text(label)),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('THỰC HÀNH 01'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildInputRow('Họ và tên', _nameController),
                    const SizedBox(height: 16),
                    _buildInputRow('Tuổi', _ageController, isNumber: true),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 180,
                height: 48,
                child: ElevatedButton(
                  onPressed: _check,
                  child: const Text('Kiểm tra'),
                ),
              ),
              const SizedBox(height: 24),
              if (_result != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(_result!, style: const TextStyle(fontSize: 18)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
