import 'package:elite_beach/core/utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomReservationDialog extends StatelessWidget {
  const CustomReservationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController AdultsNumController = TextEditingController();
    TextEditingController KidsNumController = TextEditingController();
    String? startDate;
    String? endDate;

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
            const Text(
              'Apply for a reservation form',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'EduAUVICWANTPre',
              ),
            ),
            Gaps.vGap30,
            //Name
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
            //Phone
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
            //Adults Num
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              controller: AdultsNumController,
              decoration: InputDecoration(
                labelText: 'Adults Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Gaps.vGap30,
            //Kids Num
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              controller: KidsNumController,
              decoration: InputDecoration(
                labelText: 'Kids Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            Gaps.vGap30,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(
                        2100,
                      ),
                    );
                  },
                  child: const Text(
                    'Start date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTPre',
                    ),
                  ),
                ),
                Gaps.hGap10,
                const Expanded(
                  child: Text('  /      /'),
                ),
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'End date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTPre',
                    ),
                  ),
                ),
                Gaps.hGap10,
                const Expanded(
                  child: Text('  /      /'),
                ),
              ],
            ),
            Gaps.vGap30,
            ElevatedButton(
              onPressed: () async {
                await Supabase.instance.client.from('reservations').insert({
                  "name": nameController.text,
                  "phone": phoneController.text,
                  "adults_number": AdultsNumController.text,
                  "kids_number": KidsNumController.text,
                  "start_date": startDate,
                  "end_date": endDate,
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
              child: const Text(
                'Send',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'EduAUVICWANTPre',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
