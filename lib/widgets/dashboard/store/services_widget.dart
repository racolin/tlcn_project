import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import '../../../models/store_model.dart';

class ServiceWidget extends StatefulWidget {
  final ServiceModel service;
  final VoidCallback delete;
  final Function(ServiceModel service) edit;

  const ServiceWidget({
    Key? key,
    required this.service,
    required this.delete,
    required this.edit,
  }) : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  late ServiceModel service;

  @override
  void initState() {
    service = widget.service;
    super.initState();
  }

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.cupertino],
    );

    if (icon != null) {
      setState(() {
        service = ServiceModel(
          icon: icon,
          serviceName: service.serviceName,
        );
      });
      widget.edit(service);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: 360,
      child: ListTile(
        leading: IconButton(onPressed: _pickIcon, icon: Icon(service.icon)),
        title: TextFormField(
          initialValue: service.serviceName,
          decoration: InputDecoration(
            labelText: 'Service name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
          onChanged: (value) {
            setState(() {
              service = ServiceModel(
                icon: service.icon,
                serviceName: value,
              );
            });
            widget.edit(service);
          },
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
