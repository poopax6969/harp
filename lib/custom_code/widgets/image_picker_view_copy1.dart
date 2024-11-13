// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerViewCopy1 extends StatefulWidget {
  const ImagePickerViewCopy1({
    super.key,
    this.width,
    this.height,
    this.onFilePicked,
    this.onFileRemoved,
  });

  final double? width;
  final double? height;
  final Future Function(String? picked)? onFilePicked;
  final Future Function(String? removed)? onFileRemoved;

  @override
  State<ImagePickerViewCopy1> createState() => _ImagePickerViewCopy1State();
}

class _ImagePickerViewCopy1State extends State<ImagePickerViewCopy1> {
  bool _isPicking = false;

  Uint8List? pickedFile;

  String? fileName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 500,
      height: widget.height ?? 500,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: Color(0xFFd9dde1),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: _pickFile,
                    child: Visibility(
                      visible: (pickedFile == null && !_isPicking),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Click here to select image',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'File format must be .PNG',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  (pickedFile != null)
                      ? _imageWidget()
                      : const SizedBox.shrink(),
                  _isPicking
                      ? LoadingWithTextWidget('Picking file')
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          if (!_isPicking && pickedFile != null) ...[
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(child: _changeThumbnailButton()),
                SizedBox(
                  height: 12,
                ),
                Expanded(child: _removeThumbnailButton()),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _changeThumbnailButton() => IconButton(
      onPressed: _pickFile, icon: Icon(Icons.change_circle_outlined));

  Widget _removeThumbnailButton() => IconButton(
      onPressed: () {
        setState(() {
          pickedFile = null;
          print('onFileRemoved');

          widget.onFileRemoved?.call('');
        });
      },
      icon: Icon(Icons.close));

  Future<void> _pickFile() async {
    final picked = await FilePicker.platform.pickFiles(
      onFileLoading: (v) {
        _onFileLoading(picking: v == FilePickerStatus.picking);
      },
      type: FileType.image,
      withData: true,
    );
    if (picked != null) {
      setState(() {
        print('picked file -- ${picked.files.first.name}');
        pickedFile = picked.files.first.bytes;
        fileName = picked.files.first.name;
        widget.onFilePicked?.call(fileName);
      });
    } else {
      _onFileLoading(picking: false);
    }
  }

  _onFileLoading({bool picking = false}) {
    setState(() {
      _isPicking = picking;
    });
  }

  Widget _imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Image.memory(
        pickedFile!,
        fit: BoxFit.cover,
        width: double.maxFinite,
        height: double.maxFinite,
      ),
    );
  }
}

class LoadingWithTextWidget extends StatelessWidget {
  final String text;

  const LoadingWithTextWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              text,
            )
          ],
        ),
      );
}