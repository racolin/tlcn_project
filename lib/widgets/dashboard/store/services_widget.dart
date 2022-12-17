import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import '../../../models/store_model.dart';

class ServiceWidget extends StatefulWidget {
  late ServiceModel service;
  final VoidCallback delete;

  ServiceWidget({
    Key? key,
    required this.service,
    required this.delete,
  }) : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  final _title = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _title.text = widget.service.serviceName;
    super.didChangeDependencies();
  }

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    // _icon = Icon(icon);
    if (icon != null) {
      setState(() {
        widget.service =
            ServiceModel(icon: icon, serviceName: widget.service.serviceName);
      });
    }

    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: 360,
      child: ListTile(
        leading:
        IconButton(onPressed: _pickIcon, icon: Icon(widget.service.icon)),
        title: TextField(
          controller: _title,
          decoration: InputDecoration(
            labelText: 'Enter service',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: widget.delete,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}