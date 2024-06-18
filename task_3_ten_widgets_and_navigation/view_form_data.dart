import 'package:flutter/material.dart'; 
  
 class ViewFormData extends StatelessWidget { 
   const ViewFormData({super.key}); 
  
   @override 
   Widget build(BuildContext context) { 
     Map data = {}; 
     data = ModalRoute.of(context)?.settings?.arguments as Map; 
  
     return Scaffold( 
       appBar: AppBar( 
         title: const Text('View Form Data'), 
       ), 
       body: Padding( 
         padding: const EdgeInsets.all(16.0), 
         child: ListView( 
           children: [ 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Name:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['name'], 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Father Name:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['fatherName'], 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Country:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['country'], 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'City:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['city'], 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Gender:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['gender'] == 1 ? "Male" : data['gender'] == 2 ? "Female" : "Not to say", 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Hobbies:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['hobbies'], 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Date:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['date'], 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Skills:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         '${data['java'] ? 'Java, ' : ''}${data['dart'] ? 'Dart, ' : ''}${data['cSharp'] ? 'C#, ' : ''}${data['cPlusPlus'] ? 'C++, ' : ''}', 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
             Card( 
               child: Padding( 
                 padding: const EdgeInsets.all(16.0), 
                 child: Center( 
                   child: Column( 
                     crossAxisAlignment: CrossAxisAlignment.center, 
                     children: [ 
                       const Text( 
                         'Muslim:', 
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                       ), 
                       Text( 
                         data['isMuslim'] ? 'Yes' : 'No', 
                         style: const TextStyle(fontSize: 20), 
                       ), 
                     ], 
                   ), 
                 ), 
               ), 
             ), 
           ], 
         ), 
       ), 
     ); 
   } 
 }
