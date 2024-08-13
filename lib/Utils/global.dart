import 'package:adv_flutter_getx/controller/employee_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

GlobalKey<FormState> formKey = GlobalKey();
var txtId = TextEditingController();
var txtName = TextEditingController();
var txtRole = TextEditingController();
var txtContact = TextEditingController();
final employeeController = Get.put(EmployeeController());


TextFormField inputDetails({
  required String label,
  required TextEditingController controller,
}) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'Required';
      } else {
        return null;
      }
    },
    controller: controller,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      label: Text(label),
      labelStyle: const TextStyle(color: Colors.black),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.black,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.black,
        ),
      ),
    ),
  );
}