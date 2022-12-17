import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app/locale_provider.dart';

/// Remember call super.build(context) in widget
abstract class BaseStateful<T extends StatefulWidget> extends State<T> {
  LocaleProvider? localeProvider;
  /// Context valid to create providers
  @mustCallSuper
  @protected
  void initDependencies(BuildContext context) {
    localeProvider = Provider.of<LocaleProvider>(context, listen: false);
  }

  @protected
  void afterFirstBuild(BuildContext context) {}

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        afterFirstBuild(context);
      }
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    initDependencies(context);
    return const SizedBox();
  }
}
