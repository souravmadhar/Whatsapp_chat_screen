import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  var pickDate = "Get Date";
  TextEditingController timePicker = TextEditingController();
  TextEditingController datePicker = TextEditingController();

  get date => null;

  get dateFormat => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text("Date and time"),
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
              ElevatedButton(
                onPressed: () async {
                 

                  var date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(3025));
                  var formattedDate = dateFormat.format(date ?? DateTime.now());
                  pickDate = formattedDate;
                  setState(() {});
                  print("date $date formattedDate $formattedDate");
                },
                child: Text("date"),
              ),
            ],
          ),
        ));
  }

  //DateFormat(String s) {}
}
