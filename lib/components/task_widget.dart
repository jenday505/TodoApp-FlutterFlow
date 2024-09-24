import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'task_model.dart';
export 'task_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.tasksDoc,
    required this.checkAction,
  });

  final TasksRecord? tasksDoc;
  final Future Function()? checkAction;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late TaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(22.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: const CheckboxThemeData(
                    shape: CircleBorder(),
                  ),
                  unselectedWidgetColor: const Color(0x8CFFFFFF),
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= widget.tasksDoc!.completed,
                  onChanged: widget.tasksDoc!.completed
                      ? null
                      : (newValue) async {
                          safeSetState(() => _model.checkboxValue = newValue!);
                          if (newValue!) {
                            await widget.checkAction?.call();
                          } else {
                            await widget.checkAction?.call();
                          }
                        },
                  side: const BorderSide(
                    width: 2,
                    color: Color(0x8CFFFFFF),
                  ),
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: widget.tasksDoc!.completed
                      ? null
                      : FlutterFlowTheme.of(context).info,
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.tasksDoc?.title,
                  'title',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}