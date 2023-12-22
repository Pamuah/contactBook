import 'package:flutter/material.dart';
import 'package:contactbook/homepage.dart';


class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
late final TextEditingController _controller;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller= TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Create New Contact'),
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 204, 130, 218),),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter Contact Name',hintStyle: TextStyle(
                    fontSize: 20,
                     fontWeight: FontWeight.w500)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: ElevatedButton(onPressed: (){
                 final contact = Contact(name: _controller.text);
                  ContactBook().add(contact: contact);
                    Navigator.pop(context);
                }, 
                child: Text('Add New Contact')),
              )
            ],
          ),
        )
    );
  }
}