import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_using_firebase_crud/firebaseFunctions/database_functions.dart';
import 'package:notes_app_using_firebase_crud/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? notessStream;
  void getontheload() async {
    notessStream = await fetchAllNotesDetails();
    setState(() {});
  }

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    super.dispose();
  }

  Widget allNotesDetails() {
    return Expanded(
      child: StreamBuilder(
        stream: notessStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade600,
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: const Offset(4, 4)),
                            const BoxShadow(
                                color: Colors.white,
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: Offset(-4, -4)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      'Title: ${ds['Name']}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      _nameTextEditingController.text =
                                          ds['Name'];
                                      _descriptionTextEditingController.text =
                                          ds['Description'];
                                      editNotesDetails(ds.id);
                                      log(ds['id']);
                                    },
                                    child: const Icon(Icons.edit,
                                        color: Colors.orange),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        await deleteNotesDetails(ds.id);
                                      },
                                      child: const Icon(Icons.delete,
                                          color: Colors.orange)),
                                ],
                              ),
                              Text(
                                'Description: ${ds['Description']}',
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Notes',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 5,
                        ),
                      ),
                      TextSpan(
                        text: 'App',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            allNotesDetails(),
          ],
        ),
      ),
    );
  }

  Future editNotesDetails(String id) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameTextEditingController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _descriptionTextEditingController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> updatedNotesInfoMap = {
                      'Name': _nameTextEditingController.text,
                      'Description': _descriptionTextEditingController.text
                    };

                    try {
                      await updateNotesDetails(id, updatedNotesInfoMap);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    } catch (e) {
                      log("Error updating employee: $e");
                      // Show error message to the user
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Failed to update employee details"),
                        ),
                      );
                    }
                  },
                  child: const Icon(Icons.done),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
