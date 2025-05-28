import 'package:flutter/material.dart';
import 'package:mobile_learn/rowLayout.dart';
import 'package:mobile_learn/textDetail.dart';
import 'package:mobile_learn/textField.dart';

class ComponentsListScreen extends StatelessWidget {
  const ComponentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UI Components List',
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
        color: Colors.grey[100],
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Display',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            
            _buildComponentCard(
              context,
              'Text',
              'Displays text',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextDetailScreen()),
                );
              },
            ),
            
            _buildComponentCard(
              context,
              'Image',
              'Displays an image',
              () {
              },
            ),
            
            const SizedBox(height: 24),
            
            const Text(
              'Input',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            
            _buildComponentCard(
              context,
              'TextField',
              'Input field for text',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextFieldDetailScreen()),
                );
              },
            ),
            
            _buildComponentCard(
              context,
              'PasswordField',
              'Input field for passwords',
              () {
              },
            ),
            
            const SizedBox(height: 24),
            
            const Text(
              'Layout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            
            _buildComponentCard(
              context,
              'Column',
              'Arranges elements vertically',
              () {
              },
            ),
            
            _buildComponentCard(
              context,
              'Row',
              'Arranges elements horizontally',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RowLayoutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentCard(BuildContext context, String title, String description, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: Colors.lightBlue[50],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}