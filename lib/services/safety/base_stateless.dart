import 'package:flutter/material.dart';

/// Remember call super.build(context) in widget
/// ignore: must_be_immutable
abstract class BaseStateless extends StatelessWidget {
  BaseStateless({Key? key}) : super(key: key);


  /// Context valid to create providers
  @mustCallSuper
  @protected
  void initDependencies(BuildContext context) {
  }

  @protected
  void afterFirstBuild(BuildContext context) {}

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    initDependencies(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      afterFirstBuild(context);
    });
    return SizedBox();
  }
}
