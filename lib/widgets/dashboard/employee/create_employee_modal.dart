import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlcn_project/models/row_model.dart';

class CreateEmployeeModal extends StatefulWidget {
  const CreateEmployeeModal({Key? key}) : super(key: key);

  @override
  State<CreateEmployeeModal> createState() => _CreateEmployeeModalState();
}

class _CreateEmployeeModalState extends State<CreateEmployeeModal> {
  var _key = GlobalKey<FormState>();
  var _name = TextEditingController();
  var _email = TextEditingController();
  var _username = TextEditingController();
  var _mobile = TextEditingController();
  var _role = '';
  var _gender = '';

  @override
  void dispose() {
    _key.currentState?.dispose();
    _name.dispose();
    _email.dispose();
    _username.dispose();
    _mobile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      actionsPadding:
          const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 24),
      title: Row(
        children: [
          const Text(
            'New Employee',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.disabled_by_default_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
      content: Form(
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              RadioGroup(
                title: 'Role',
                onChanged: (value) {
                  _role = value;
                },
                options: const ['Admin', 'Salesperson', 'Warehouse Staff'],
              ),
              const SizedBox(
                height: 24,
              ),
              RadioGroup(
                title: 'Gender',
                onChanged: (value) {
                  _gender = value;
                },
                options: const ['Male', 'Female', 'Other'],
              ),
              const SizedBox(
                height: 24,
              ),
              InputDate(title: 'Day of birth', onChanged: (date) {}),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.blue)),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            ),
          ),
          onPressed: () {
            EmployeeModel employee = EmployeeModel(
              id: '',
              image: '',
              name: _name.text,
              username: _username.text,
              email: _email.text,
              role: _role,
              joinDate: DateTime.now(),
              hide: false,
            );
            Navigator.of(context).pop(employee);
          },
          child: const Text(
            'Create',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class InputDate extends StatefulWidget {
  final Function onChanged;
  final String title;

  const InputDate({
    Key? key,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  final _date = TextEditingController();

  @override
  void dispose() {
    _date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _date.text = DateFormat('dd/MM/yyyy').format(DateTime(2001, 05, 11));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: _date,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.date_range),
                onPressed: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2001, 05, 11),
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2008));
                  if (date != null) {
                    _date.text = DateFormat('dd/MM/yyyy').format(date);
                  }
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RadioGroup extends StatefulWidget {
  final Function onChanged;
  final String title;
  final List<String> options;
  final bool isHorizontal;

  const RadioGroup({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.options,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  var _role;

  @override
  void initState() {
    _role = widget.options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        Row(
          children: widget.options
              .map(
                (e) => Expanded(
                  flex: 1,
                  child: RadioListTile<String>(
                    title: Text(e),
                    value: e,
                    groupValue: _role,
                    onChanged: (value) {
                      if (value != null && value != _role) {
                        setState(() {
                          _role = value;
                        });
                      }
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
