import 'package:elite_beach/core/utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomReviewDialog extends StatelessWidget {
  const CustomReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController reviewMessageController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(
        12,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Gaps.vGap30,
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Gaps.vGap30,
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              controller: reviewMessageController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Review',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Gaps.vGap30,
            Gaps.vGap30,
            ElevatedButton(
              onPressed: () async {
                await Supabase.instance.client.from('reviews').insert({
                  "name": nameController.text,
                  "phone": phoneController.text,
                  "review_message": reviewMessageController.text,
                }).then(
                  (value) {
                    Navigator.pop(context);
                  },
                );
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Your review has been sent , Thanks !')),
                  );
                }
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
