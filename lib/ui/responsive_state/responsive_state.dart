import 'package:flutter/material.dart';

import 'view_state.dart';

class ResponsiveState extends StatelessWidget {
  final ViewState state;
  final Widget idleWidget;
   Widget? busyWidget;
   Widget? dataFetchedWidget;
   Widget? noDataAvailableWidget;
   Widget? errorWidget;
   Widget? successWidget;
   Widget? waitingForInputWidget;

  // returns a widget based on the provided ViewState
  ResponsiveState({
    Key ? key,
    required this.state,
    required this.idleWidget,
    this.busyWidget,
    this.errorWidget,
    this.dataFetchedWidget,
    this.noDataAvailableWidget,
    this.successWidget,
    this.waitingForInputWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.Idle:
        return idleWidget;
      case ViewState.Busy:
        return busyWidget ?? idleWidget;
      case ViewState.DataFetched:
        return dataFetchedWidget ?? idleWidget;
      case ViewState.NoDataAvailable:
        return noDataAvailableWidget ?? idleWidget;
      case ViewState.Error:
        return errorWidget ?? idleWidget;
      case ViewState.Success:
        return successWidget ?? idleWidget;
      default:
        return idleWidget;
    }
  }
}
