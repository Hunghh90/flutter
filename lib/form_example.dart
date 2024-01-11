import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'entity/student_entity.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {

  List<Student> students = [];
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 200,
      height: 500,
      child: SafeArea(
        child: Scaffold(
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "your name...",
                        labelText: "Input your name"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Input your name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: "your age...",
                        labelText: "Input your age"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Input your age";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                        hintText: "your address...",
                        labelText: "Input your address"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Input your address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _imageController,
                    decoration: InputDecoration(
                        hintText: "your image...",
                        labelText: "Input your image"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Input your image";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String name = _nameController.text;
                          int age = int.parse(_ageController.text);
                          String address = _addressController.text;
                          String image = _imageController.text;
                          Student student = Student(name: name,
                              age: age,
                              address: address,
                              image: image);
                          setState(() {
                            students.add(student); //
                          });

                        }
                      },
                      child: Text("submit"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("List",style: TextStyle(color: Colors.green,fontSize: 50,),),
                  Expanded(

                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: students.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                  child: Text(
                                      "${students[index].name} - ${students[index]
                                          .address} - ${students[index]
                                          .name} - ${students[index].image}")
                              )
                            ],
                          );
                        }
                    ),
                  )
                ],

              ),
            )
        ),
      ),
    );
  }
}
