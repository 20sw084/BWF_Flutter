import 'package:flutter/material.dart'; 
import 'ViewFormData.dart'; 
  
 void main() => runApp( 
       MaterialApp( 
         debugShowCheckedModeBanner: false, 
         routes: { 
           '/ViewFormData': (context) => const ViewFormData(), 
         }, 
         home: Home(), 
       ), 
     ); 
 class Home extends StatefulWidget { 
   const Home({Key? key}) : super(key: key); 
  
   @override 
   State<Home> createState() => _HomeState(); 
 } 
 class _HomeState extends State<Home> { 
   final _countryitems = [ 
     "China", 
     "Russia", 
     "Iran", 
     "Pakistan", 
     "Iraq", 
   ]; 
   var _countryValue = "Pakistan"; 
   final _items = [ 
     "Islamabad", 
     "Hyderabad", 
     "Rawalpindi", 
     "Multan", 
     "Lahore", 
     "Karachi", 
   ]; 
   var _cityValue = "Hyderabad"; 
   var _valueRadio = 1; 
   final TextEditingController _hobbies = TextEditingController(); 
   final _formKey = GlobalKey<FormState>(); 
   final TextEditingController _name = TextEditingController(); 
   bool isMuslim = false; 
   final TextEditingController _fatherName = TextEditingController(); 
   final TextEditingController _date = TextEditingController(); 
   bool? isChecked = false; 
   bool? isChecked2 = false; 
   bool? isChecked3 = false; 
   bool? isChecked4 = false; 
   @override 
   Widget build(BuildContext context) { 
     return Scaffold( 
       appBar: AppBar( 
         backgroundColor: Colors.cyan, 
         title: const Text( 
           "User Info", 
           style: TextStyle( 
             color: Colors.black, 
             fontSize: 25.0, 
           ), 
         ), 
       ), 
       body: Padding( 
         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60), 
         child: SingleChildScrollView( 
           child: Column( 
             children: [ 
               const SizedBox( 
                 height: 15.0, 
               ), 
               Form( 
                 key: _formKey, 
                 child: Column( 
                   children: [ 
                     TextFormField( 
                       controller: _name, 
                       decoration: InputDecoration( 
                         labelText: 'Name', 
                         filled: true, 
                         prefixIcon: Icon(Icons.person), 
                         enabledBorder: 
                             OutlineInputBorder(borderSide: BorderSide.none), 
                         focusedBorder: OutlineInputBorder( 
                             borderSide: BorderSide(color: Colors.blue)), 
                       ), 
                       validator: (value) { 
                         if (value!.isEmpty) { 
                           return ("Enter valid name"); 
                         } else { 
                           return null; 
                         } 
                       }, 
                     ), 
                     const SizedBox( 
                       height: 15, 
                     ), 
                     TextFormField( 
                       controller: _fatherName, 
                       decoration: InputDecoration( 
                         labelText: 'FatherName', 
                         filled: true, 
                         prefixIcon: Icon(Icons.person_2), 
                         enabledBorder: 
                             OutlineInputBorder(borderSide: BorderSide.none), 
                         focusedBorder: OutlineInputBorder( 
                             borderSide: BorderSide(color: Colors.blue)), 
                       ), 
                       validator: (value) { 
                         if (value!.isEmpty) { 
                           return ("Enter valid name"); 
                         } else { 
                           return null; 
                         } 
                       }, 
                     ), 
                     const SizedBox( 
                       height: 15, 
                     ), 
                     Row( 
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                       children: [ 
                         const Padding( 
                           padding: EdgeInsets.fromLTRB(1.0, 2.0, 50.0, 1.0), 
                           child: Text( 
                             "Select country", 
                             style: TextStyle( 
                               fontSize: 16.0, 
                             ), 
                           ), 
                         ), 
                         DropdownButton( 
                           value: _countryValue, 
                           items: _countryitems.map((String e) { 
                             return DropdownMenuItem<String>( 
                               value: e, 
                               child: Text(e), 
                             ); 
                           }).toList(), 
                           onChanged: (String? newValue) { 
                             setState(() { 
                               _countryValue = newValue!; 
                             }); 
                           }, 
                         ), 
                       ], 
                     ), 
                     const SizedBox( 
                       height: 15.0, 
                     ), 
                     Row( 
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                       children: [ 
                         const Padding( 
                           padding: EdgeInsets.fromLTRB(1.0, 2.0, 50.0, 1.0), 
                           child: Text( 
                             "Select city", 
                             style: TextStyle( 
                               fontSize: 16.0, 
                             ), 
                           ), 
                         ), 
                         DropdownButton( 
                           value: _cityValue, 
                           items: _items.map((String e) { 
                             return DropdownMenuItem<String>( 
                               value: e, 
                               child: Text(e), 
                             ); 
                           }).toList(), 
                           onChanged: (String? newValue) { 
                             setState(() { 
                               _cityValue = newValue!; 
                             }); 
                           }, 
                         ), 
                       ], 
                     ), 
                     Row( 
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                       children: [ 
                         const Padding( 
                           padding: EdgeInsets.all(0.0), 
                           child: Text( 
                             "Select gender", 
                             style: TextStyle(fontSize: 16.0), 
                           ), 
                         ), 
                         SizedBox( 
                           width: 200.0, 
                           child: Column( 
                             children: [ 
                               RadioListTile<int>( 
                                 title: const Text("Male"), 
                                 value: 1, 
                                 groupValue: _valueRadio, 
                                 onChanged: (value) { 
                                   setState(() { 
                                     _valueRadio = value!; 
                                   }); 
                                 }, 
                                 contentPadding: EdgeInsets.zero, 
                                 controlAffinity: 
                                     ListTileControlAffinity.leading, 
                               ), 
                               RadioListTile( 
                                 title: const Text("Female"), 
                                 value: 2, 
                                 groupValue: _valueRadio, 
                                 onChanged: (value) { 
                                   setState(() { 
                                     _valueRadio = value!; 
                                   }); 
                                 }, 
                                 contentPadding: EdgeInsets.zero, 
                               ), 
                               RadioListTile( 
                                 title: const Text("Not to say"), 
                                 value: 3, 
                                 groupValue: _valueRadio, 
                                 onChanged: (value) { 
                                   setState(() { 
                                     _valueRadio = value!; 
                                   }); 
                                 }, 
                                 contentPadding: EdgeInsets.zero, 
                               ), 
                             ], 
                           ), 
                         ), 
                       ], 
                     ), 
                     const SizedBox( 
                       height: 15, 
                     ), 
                     TextField( 
                       controller: _date, 
                       decoration: InputDecoration( 
                         labelText: 'Date', 
                         filled: true, 
                         prefixIcon: Icon(Icons.calendar_today), 
                         enabledBorder: 
                             OutlineInputBorder(borderSide: BorderSide.none), 
                         focusedBorder: OutlineInputBorder( 
                             borderSide: BorderSide(color: Colors.blue)), 
                       ), 
                       readOnly: true, 
                       onTap: () { 
                         _selectData(); 
                       }, 
                     ), 
                     Row( 
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                       children: [ 
                         const Text( 
                           "Skills", 
                           style: TextStyle( 
                             fontSize: 16.0, 
                           ), 
                         ), 
                         SizedBox( 
                           width: 100.0, 
                           child: Column( 
                             children: [ 
                               CheckboxListTile( 
                                 title: const Text("Java"), 
                                 checkColor: Colors.white, 
                                 value: isChecked, 
                                 onChanged: (bool? isChecked) { 
                                   setState(() { 
                                     this.isChecked = isChecked; 
                                   }); 
                                 }, 
                                 controlAffinity: 
                                     ListTileControlAffinity.leading, 
                                 contentPadding: EdgeInsets.zero, 
                               ), 
                               CheckboxListTile( 
                                 title: const Text("Dart"), 
                                 value: isChecked2, 
                                 onChanged: (bool? isChecked2) { 
                                   setState(() { 
                                     this.isChecked2 = isChecked2; 
                                   }); 
                                 }, 
                                 controlAffinity: 
                                     ListTileControlAffinity.leading, 
                                 contentPadding: EdgeInsets.zero, 
                               ), 
                             ], 
                           ), 
                         ), 
                         SizedBox( 
                           width: 100.0, 
                           child: Column( 
                             children: [ 
                               CheckboxListTile( 
                                 title: const Text("C#"), 
                                 checkColor: Colors.white, 
                                 value: isChecked3, 
                                 onChanged: (bool? isChecked3) { 
                                   setState(() { 
                                     this.isChecked3 = isChecked3; 
                                   }); 
                                 }, 
                                 controlAffinity: 
                                     ListTileControlAffinity.leading, 
                                 contentPadding: EdgeInsets.zero, 
                               ), 
                               CheckboxListTile( 
                                 title: const Text("C++"), 
                                 value: isChecked4, 
                                 onChanged: (bool? isChecked4) { 
                                   setState(() { 
                                     this.isChecked4 = isChecked4; 
                                   }); 
                                 }, 
                                 controlAffinity: 
                                     ListTileControlAffinity.leading, 
                                 contentPadding: EdgeInsets.zero, 
                               ), 
                             ], 
                           ), 
                         ), 
                       ], 
                     ), 
                     SwitchListTile( 
                       title: const Text( 
                         'Are you Muslim?', 
                         style: TextStyle( 
                           fontSize: 16.0, 
                         ), 
                       ), 
                       value: isMuslim, 
                       activeColor: Colors.blue, 
                       onChanged: (value) { 
                         setState(() { 
                           isMuslim = value; 
                         }); 
                       }, 
                     ), 
                   ], 
                 ), 
               ), 
               Padding( 
                 padding: const EdgeInsets.all(2.0), 
                 child: Align( 
                   alignment: Alignment.centerRight, 
                   child: ElevatedButton.icon( 
                     style: 
                         ElevatedButton.styleFrom(backgroundColor: Colors.green), 
                     onPressed: () { 
                       if (_formKey.currentState!.validate()) { 
                         Navigator.pushNamed( 
                           context, 
                           '/ViewFormData', 
                           arguments: { 
                             'name': _name.text, 
                             'fatherName': _fatherName.text, 
                             'date': _date.text, 
                             'country': 
                                 _countryValue, // Passing the selected country 
                             'city': _cityValue, // Passing the selected city 
                             'gender': 
                                 _valueRadio, // Passing the selected gender 
                             'hobbies': _hobbies.text, 
                             'java': isChecked ?? 
                                 false, // Passing the status of Java checkbox 
                             'dart': isChecked2 ?? 
                                 false, // Passing the status of Dart checkbox 
                             'cSharp': isChecked3 ?? 
                                 false, // Passing the status of C# checkbox 
                             'cPlusPlus': isChecked4 ?? 
                                 false, // Passing the status of C++ checkbox 
                             'isMuslim': isMuslim ?? 
                                 false, // Passing the status of Muslim switch 
                           }, 
                         ); 
                       } 
                     }, 
                     icon: const Icon( 
                       Icons.double_arrow, 
                       color: Colors.white, 
                     ), 
                     label: const Text( 
                       "Submit", 
                       style: TextStyle( 
                         color: Colors.white, 
                         fontSize: 16.0, 
                       ), 
                     ), 
                   ), 
                 ), 
               ), 
             ], 
           ), 
         ), 
       ), 
     ); 
   } 
  
   Future<void> _selectData() async { 
     DateTime? _picked = await showDatePicker( 
         context: context, 
         initialDate: DateTime.now(), 
         firstDate: DateTime(2000), 
         lastDate: DateTime(2100)); 
     if (_picked != null) { 
       setState(() { 
         _date.text = _picked.toString().split(" ")[0]; 
       }); 
     } 
   } 
 }
