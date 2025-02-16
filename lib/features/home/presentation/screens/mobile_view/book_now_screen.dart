import 'package:elite_beach/core/utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomReservationScreen extends StatefulWidget {
  const CustomReservationScreen({super.key});

  @override
  _CustomReservationScreenState createState() =>
      _CustomReservationScreenState();
}

class _CustomReservationScreenState extends State<CustomReservationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adultsNumController = TextEditingController();
  final TextEditingController kidsNumController = TextEditingController();
  DateTime? checkInDate;
  DateTime? checkOutDate;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
        } else {
          checkOutDate = picked;
        }
      });
    }
  }

  Future<void> _submitForm() async {
    if (formKey.currentState!.validate() &&
        checkInDate != null &&
        checkOutDate != null) {
      setState(() {
        isLoading = true;
      });
      await Supabase.instance.client.from('reservations').insert({
        "guest_name": nameController.text,
        "phone_number": phoneController.text,
        "adults_number": adultsNumController.text,
        "kids_number": kidsNumController.text,
        "start_date":
            "${checkInDate!.year}-${checkInDate!.month}-${checkInDate!.day}",
        "end_date":
            "${checkOutDate!.year}-${checkOutDate!.month}-${checkOutDate!.day}",
      });
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Reservation Sent"),
          content: const Text(
              "Your reservation has been sent, we will contact you soon!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservation Form"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Apply for a reservation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Gaps.vGap30,
                TextFormField(
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                ),
                Gaps.vGap16,
                TextFormField(
                  validator: (value) =>
                      value == null || value.isEmpty || value.length < 11
                          ? 'Please enter your phone'
                          : null,
                  controller: phoneController,
                  decoration: const InputDecoration(
                      labelText: 'Phone', border: OutlineInputBorder()),
                ),
                Gaps.vGap16,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter number of adults'
                            : null,
                        controller: adultsNumController,
                        decoration: const InputDecoration(
                            labelText: 'Adults', border: OutlineInputBorder()),
                      ),
                    ),
                    Gaps.hGap20,
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter number of kids'
                            : null,
                        controller: kidsNumController,
                        decoration: const InputDecoration(
                            labelText: 'Kids', border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                Gaps.vGap16,
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            checkInDate == null
                                ? 'Select Check-in Date'
                                : '${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Gaps.hGap20,
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            checkOutDate == null
                                ? 'Select Check-out Date'
                                : '${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.vGap30,
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: _submitForm,
                        child: const Text(
                          'Send',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
