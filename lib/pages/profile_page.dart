import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(

        child: Column(
          children: [
            Obx(() => CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(controller.photoUrl.value),
                  backgroundColor: Colors.grey.shade200,
                )),
            const SizedBox(height: 16),
            Obx(() => Text(
                  controller.username.value.isNotEmpty ? controller.username.value : 'Guest',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 8),
            Obx(() => Text(controller.email.value)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => controller.logout(),
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
