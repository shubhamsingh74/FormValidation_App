import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_project/widgets/custom_textfields.dart';

import '../constants/string_constants.dart';

class ListViewImpl extends StatefulWidget {
  ListViewImpl({
    super.key,
  });

  @override
  State<ListViewImpl> createState() => _ListViewImplState();
}

class _ListViewImplState extends State<ListViewImpl> {
  var myUser = [
    {
      'name': StringConstants.name1,
      'image': StringConstants.imageLink1,
    },
    {
      'name': StringConstants.name2,
      'image': StringConstants.imageLink2,
    },
    {
      'name': StringConstants.name3,
      'image': StringConstants.imageLink3,
    },
    {
      'name': StringConstants.name4,
      'image': StringConstants.imageLink4,
    },
    {
      'name': StringConstants.name5,
      'image': StringConstants.imageLink5,
    },
    {
      'name': StringConstants.name6,
      'image': StringConstants.imageLink6,
    },
    {
      'name': StringConstants.name7,
      'image': StringConstants.imageLink7,
    },
    {
      'name': StringConstants.name8,
      'image': StringConstants.imageLink8,
    },
    {
      'name': StringConstants.name9,
      'image': StringConstants.imageLink9,
    },
    {
      'name': StringConstants.name10,
      'image': StringConstants.imageLink10,
    },
    {
      'name': StringConstants.name11,
      'image': StringConstants.imageLink11,
    },
    {
      'name': StringConstants.name12,
      'image': StringConstants.imageLink12,
    },
    {
      'name': StringConstants.name13,
      'image': StringConstants.imageLink13,
    },
    {
      'name': StringConstants.name14,
      'image': StringConstants.imageLink14,
    },
  ];

  final TextEditingController _nameController = TextEditingController();

  void addUsers() {
    if (_nameController.value.text.isNotEmpty) {
      myUser.add({
        'name': _nameController.value.text,
        'image': myUser.first['image']!,
      });
      _nameController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Name First"),
      ));
    }
    setState(() {});
  }

  void removeUsers(index) {
    myUser.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(myUser.length);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.teal,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          StringConstants.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(
            Icons.person,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 5,
        backgroundColor: Colors.teal,
        child: const Icon(
          size: 34,
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: CustomTextField(
                      icon: const Icon(Icons.person),
                      controller: _nameController,
                      hintText: "Name",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  IconButton(
                      color: Colors.teal,
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        addUsers();
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 25,
                      ))
                ],
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.only(bottom: 80),
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myUser.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(myUser[index]['name'] ?? "")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            myUser[index]['image'] ?? ""),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  content: Text(
                                    myUser[index]['name']!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  actions: const [
                                    Icon(
                                      Icons.chat,
                                      size: 25,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.call,
                                      size: 25,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.video_call,
                                      size: 25,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.settings,
                                      size: 25,
                                      color: Colors.teal,
                                    ),
                                  ],
                                );
                              });
                        },
                        child: CircleAvatar(
                          radius: 23,
                          backgroundImage:
                              NetworkImage(myUser[index]['image'] ?? ""),

                          // index % 2 == 0
                          //     ? const NetworkImage(StringConstants.imageLink1)
                          //     : const NetworkImage(StringConstants.imageLink2),
                        ),
                      ),
                      title: Text(
                        myUser[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text(
                        "Typing...",
                        style: TextStyle(color: Colors.teal),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          removeUsers(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 0,
                  height: 0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
