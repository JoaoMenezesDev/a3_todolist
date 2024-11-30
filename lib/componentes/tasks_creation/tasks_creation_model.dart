import '/flutter_flow/flutter_flow_util.dart';
import 'tasks_creation_widget.dart' show TasksCreationWidget;
import 'package:flutter/material.dart';

class TasksCreationModel extends FlutterFlowModel<TasksCreationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
