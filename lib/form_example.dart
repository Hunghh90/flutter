import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'detail.dart';
import 'entity/student_entity.dart';
import 'helper/sql_helper.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  static const String routeName = "/formPage";

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  List<Student> students = [];

  final _formKey = GlobalKey<FormState>();
  int _idEdit = 0;
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
                    hintText: "your name...", labelText: "Input your name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input your name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    hintText: "your age...", labelText: "Input your age"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input your age";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                    hintText: "your address...",
                    labelText: "Input your address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input your address";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                    hintText: "your image...", labelText: "Input your image"),
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      int age = int.parse(_ageController.text);
                      String address = _addressController.text;
                      String image = _imageController.text;
                      Student student = Student(
                          name: name, age: age, address: address, image: image);
                      if(_idEdit == 0) {
                        var _id = await SQLHelper.createItem(student);
                        if (_id != 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Success')),
                          );
                          setState(() {
                            _nameController.clear();
                            _ageController.clear();
                            _addressController.clear();
                            _imageController.clear();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Fail')),
                          );
                        }
                      }else{
                        student.id = _idEdit;
                        await SQLHelper.updateItem(student);
                        setState((){
                          _idEdit = 0;
                          _nameController.clear();
                          _ageController.clear();
                          _addressController.clear();
                          _imageController.clear();
                        });
                      }
                    }
                  },
                  child: Text("submit"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "List",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 50,
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: SQLHelper.getItems(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Text("Not data");
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text("error get data");
                            } else {
                              students = snapshot.data!;
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return ListTile(
                                      tileColor: Colors.green.withOpacity(0.4),
                                      title: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              Detail.routeName,
                                              arguments: snapshot.data?[index]);
                                        },
                                        child: Text(
                                          students[index].name,
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () async {
                                              Student student =
                                                  await SQLHelper.getItem(
                                                      students[index].id
                                                          as int);
                                              _idEdit = int.parse(student.id.toString());
                                              _nameController.text =
                                                  student.name;
                                              _ageController.text =
                                                  student.age.toString();
                                              _addressController.text =
                                                  student.address;
                                              _imageController.text =
                                                  student.image;
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () async {
                                              await SQLHelper.deleteItem(
                                                  students[index].id as int);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                        }
                      }))
            ],
          ),
        )),
      ),
    );
  }
}
