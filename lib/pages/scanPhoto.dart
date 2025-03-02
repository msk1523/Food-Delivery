import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ScanPhoto extends StatefulWidget {
  const ScanPhoto({super.key});

  @override
  State<ScanPhoto> createState() => _ScanPhotoState();
}

class _ScanPhotoState extends State<ScanPhoto> {
  final ImagePicker _picker = ImagePicker();
  String _recognizedText = '';
  bool _isLoading = false;

  /// Method to pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile == null) return;

    File imageFile = File(pickedFile.path);

    setState(() {
      _isLoading = true;
    });

    // Upload image to Firebase
    await _uploadToFirebase(imageFile);

    // Process image to extract text
    await _processImage(imageFile);

    setState(() {
      _isLoading = false;
    });
  }

  /// Method to upload image to Firebase Storage
  Future<void> _uploadToFirebase(File imageFile) async {
    try {
      String fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}.jpg';
      await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
      print('Image uploaded to Firebase Storage');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  /// Method to process the image and extract text
  Future<void> _processImage(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer =
        GoogleMlKit.vision.textRecognizer(); // Corrected line

    try {
      final text = await textRecognizer.processImage(inputImage);

      setState(() {
        _recognizedText = text.text;
      });
    } catch (e) {
      print('Error processing image: $e');
    } finally {
      textRecognizer.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Photo'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Buttons for Camera and Gallery
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take Photo'),
              ),
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: const Icon(Icons.photo_library),
                label: const Text('Pick from Gallery'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Loading Indicator
          if (_isLoading)
            const CircularProgressIndicator()
          else
            // Display recognized text
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _recognizedText.isEmpty
                      ? 'No text recognized yet. Upload or take a photo.'
                      : _recognizedText,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
