import 'package:elite_beach/core/utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomReservationDialog extends StatelessWidget {
  const CustomReservationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController adultsNumController = TextEditingController();
    TextEditingController kidsNumController = TextEditingController();
    TextEditingController checkInDateController = TextEditingController();
    TextEditingController checkOutDateController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(
        12,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.red,
                  ),
                ),
              ),
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                      controller: adultsNumController,
                      decoration: InputDecoration(
                        labelText: 'Adults Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Gaps.hGap20,
                  //Kids Num
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                      controller: kidsNumController,
                      decoration: InputDecoration(
                        labelText: 'Kids Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Dates
              Gaps.vGap30,

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                      controller: checkInDateController,
                      decoration: InputDecoration(
                        labelText: 'Check in date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Gaps.hGap20,
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                      controller: checkOutDateController,
                      decoration: InputDecoration(
                        labelText: 'Check out date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Gaps.vGap30,
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await Supabase.instance.client.from('reservations').insert({
                      "guest_name": nameController.text,
                      "phone_number": phoneController.text,
                      "adults_number": adultsNumController.text,
                      "kids_number": kidsNumController.text,
                      "start_date": checkInDateController.text,
                      "end_date": checkOutDateController.text,
                    }).then(
                      (value) {
                        Navigator.pop(context);
                      },
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Your reservation has been sent , we will contact with you soon !')),
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
      ),
    );
  }
}
