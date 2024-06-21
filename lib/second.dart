import 'package:flutter/material.dart';


class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController timePicker = TextEditingController();
  TextEditingController datePicker = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("New Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: timePicker,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.timelapse),
                  labelText: 'Pick Time',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.purple,
                  ),
                ),
                onTap: () async {
                  var time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  if (time != null) {
                    setState(() {
                      timePicker.text = time.format(context);
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: datePicker,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.calendar_today),
                  labelText: 'Pick Date',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.purple,
                  ),
                ),
                onTap: () async {
                  DateTime? datetime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025));

                  if (datetime != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(datetime);

                    setState(() {
                      datePicker.text = formattedDate;
                    });
                  }
                },
              ),
            ],
          ),
        ));
  }
  
  DateFormat(String s) {}
}
