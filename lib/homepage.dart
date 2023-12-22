import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Contact Book'),
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 204, 130, 218),),

        body: ValueListenableBuilder(
          valueListenable: ContactBook(),
          builder: (contact,value,child){
            final contacts = value as List<Contact>;
            return  ListView.builder(
            itemCount:contacts.length,
            itemBuilder: (context,index){
              final contact = contacts[index];
            return Dismissible(
              onDismissed: (direction){
                ContactBook().remove(contact: contact);
              },
              key: ValueKey(contact.id),
              child: Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Material(
                  elevation: 6,
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text(contact.name),
                  ),
                ),
              ),
            );
          });
          },
        
        ),

        floatingActionButton: FloatingActionButton(onPressed: () async{
       await   Navigator.of(context).pushNamed('/second');
        },
        backgroundColor: Color.fromARGB(255, 206, 151, 218),
        elevation: 10,
        child: Icon(Icons.add,size: 35,),
        ),
    );
  }
}

class Contact {
  final String id;
  final String name;
  Contact({required this.name}): id=const Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>>{
  ContactBook._SharedInstance():super([]);
  static final ContactBook _shared=ContactBook._SharedInstance();
  factory ContactBook()=> _shared;

 
  int get length => value.length;

  void add({required Contact contact}){
   final contacts=value;
   contacts.add(contact);
   notifyListeners();
  }

  void remove({required Contact contact}){
    final contacts = value;
    if(contacts.contains(contact)){
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex})=>
  value.length> atIndex?value[atIndex]:null;
}