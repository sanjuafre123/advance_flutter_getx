import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/global.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.white,),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Employee data',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: employeeController.employeeList.length,
            itemBuilder: (context, index) => ListTile(
              leading:
                  Text(employeeController.employeeList[index].id.toString()),
              title: Text(employeeController.employeeList[index].name),
              subtitle: Text(employeeController.employeeList[index].role),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Update details'),
                          actions: [
                            inputDetails(
                              label: 'ID',
                              controller: txtId,
                            ),
                            inputDetails(
                              label: 'Name',
                              controller: txtName,
                            ),
                            inputDetails(
                              label: 'Role',
                              controller: txtRole,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                employeeController.updateEmployeeData(index, {
                                  'id': txtId.text,
                                  'name': txtName.text,
                                  'role': txtRole.text,
                                });
                                txtName.clear();
                                txtId.clear();
                                txtRole.clear();
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      employeeController.deleteEmployeeData(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Form(
              key: formKey,
              child: AlertDialog(
                title: const Text('Enter details'),
                actions: [
                  inputDetails(
                    label: 'ID',
                    controller: txtId,
                  ),
                  inputDetails(
                    label: 'Name',
                    controller: txtName,
                  ),
                  inputDetails(
                    label: 'Role',
                    controller: txtRole,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          bool response = formKey.currentState!.validate();
                          if (response) {
                            employeeController.addEmployeeData({
                              'id': txtId.text,
                              'name': txtName.text,
                              'role': txtRole.text,
                            });
                            txtName.clear();
                            txtId.clear();
                            txtRole.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
