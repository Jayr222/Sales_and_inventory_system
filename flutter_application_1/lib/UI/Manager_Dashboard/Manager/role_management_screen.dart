import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/services/admin_service.dart';

class RoleManagementScreen extends StatelessWidget {
  final AdminService _adminService = AdminService();
  final String currentUserEmail;

  RoleManagementScreen({required this.currentUserEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Role Management'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data!.docs;

          // Attempt to find the current user's document
          final currentUserDoc =
              users.where((doc) => doc['email'] == currentUserEmail).toList();

          // Check if the current user is an admin
          final isCurrentUserAdmin = currentUserDoc.isNotEmpty &&
              currentUserDoc.first['role'] == 'Admin';

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final userId = user.id;
              final email = user['email'];
              final role = user['role'];

              return ListTile(
                title: Text(email),
                subtitle: Text('Role: $role'),
                trailing: (isCurrentUserAdmin && email != currentUserEmail)
                    ? DropdownButton<String>(
                        value: role,
                        items:
                            ['Admin', 'Manager', 'Staff'].map((String newRole) {
                          return DropdownMenuItem<String>(
                            value: newRole,
                            child: Text(newRole),
                          );
                        }).toList(),
                        onChanged: (String? newRole) async {
                          if (newRole != null) {
                            try {
                              // Update the user's role in Firestore
                              await _adminService.updateUserRole(
                                  userId, newRole);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Role updated to $newRole'),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error updating role: $e'),
                                ),
                              );
                            }
                          }
                        },
                      )
                    : null, // Only allow role change if admin
              );
            },
          );
        },
      ),
    );
  }
}
