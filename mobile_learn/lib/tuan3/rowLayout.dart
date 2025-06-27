import 'package:flutter/material.dart';

class RowLayoutScreen extends StatelessWidget {
  const RowLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Row Layout',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.grey[50],
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // Row 1
            _buildRow([
              Colors.blue[200]!,
              Colors.blue[600]!,
              Colors.blue[200]!,
            ]),
            
            const SizedBox(height: 16),
            
            // Row 2
            _buildRow([
              Colors.blue[200]!,
              Colors.blue[600]!,
              Colors.blue[200]!,
            ]),
            
            const SizedBox(height: 16),
            
            // Row 3
            _buildRow([
              Colors.blue[200]!,
              Colors.blue[600]!,
              Colors.blue[200]!,
            ]),
            
            const SizedBox(height: 16),
            
            // Row 4
            _buildRow([
              Colors.blue[200]!,
              Colors.blue[600]!,
              Colors.blue[200]!,
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<Color> colors) {
    return Row(
      children: colors.map((color) => _buildBox(color)).toList(),
    );
  }

  Widget _buildBox(Color color) {
    return Expanded(
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}