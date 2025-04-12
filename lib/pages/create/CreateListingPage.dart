import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:gomdong/pages/create/CreateListingPage.dart';

class CreateListingPage extends StatefulWidget {
  const CreateListingPage({Key? key}) : super(key: key);

  @override
  State<CreateListingPage> createState() => _CreateListingPageState();
}

class _CreateListingPageState extends State<CreateListingPage> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();

  String _title = '';
  String _description = '';
  int _participants = 1;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _createListing() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // TODO: Handle listing creation logic
      print("Title: $_title, Description: $_description, People: $_participants");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("공동구매 글 작성")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? Container(
                        height: 180,
                        color: Colors.grey[300],
                        child: const Icon(Icons.add_a_photo, size: 50),
                      )
                    : Image.file(_image!, height: 180, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: "제목"),
                validator: (value) => value == null || value.isEmpty ? '제목을 입력해주세요' : null,
                onSaved: (value) => _title = value ?? '',
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "설명"),
                maxLines: 6,
                validator: (value) => value == null || value.isEmpty ? '설명을 입력해주세요' : null,
                onSaved: (value) => _description = value ?? '',
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "최대 인원 수"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return '인원 수를 입력해주세요';
                  final num = int.tryParse(value);
                  return (num == null || num < 1) ? '1 이상의 숫자를 입력해주세요' : null;
                },
                onSaved: (value) => _participants = int.parse(value!),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _createListing,
                child: const Text("공동구매 생성"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
