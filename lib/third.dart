import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class NewScreenDesign extends StatefulWidget {
  const NewScreenDesign({super.key});

  @override
  State<NewScreenDesign> createState() => _NewScreenDesignState();
}

class _NewScreenDesignState extends State<NewScreenDesign> {
  var productEditingController = TextEditingController();
  var focusNode = FocusNode();
  var categoryEditingController = TextEditingController();
  var categoryFocusNode = FocusNode();
  var isHidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Discover the best\nProduct!",
          style: GoogleFonts.roboto(
              color: Color.fromARGB(255, 41, 42, 43),
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
        actions: [
          CircleAvatar(
            radius: 50,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: productEditingController,
              focusNode: focusNode,
              decoration: const InputDecoration(
                  hintText: "Search your product",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (productEditingController.text.toString().isEmpty) {
                  focusNode.requestFocus();
                  Fluttertoast.showToast(msg: "Enter the product to search ");
                }
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
