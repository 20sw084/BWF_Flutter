import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final SignatureController _signatureController = SignatureController();
  XFile? _image;

  void _takePicture() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Collection App')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
              _image == null
                  ? ElevatedButton(
                      onPressed: _takePicture,
                      child: Text('Take Picture'),
                    )
                  : Container(
                      width: 150.0, // Adjust the size as needed
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Background color of the circle
                      ),
                      child: ClipOval(
                        child: Image.file(
                          File(_image!.path),
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              Signature(
                controller: _signatureController,
                height: 200,
                backgroundColor: Colors.white,
              ),
              ElevatedButton(
                onPressed: () {
                  // Save the signature or upload data to a server
                  final signature = _signatureController.toPngBytes();
                  // Implement your logic to save or send data
                },
                child: Text('Save Signature'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
