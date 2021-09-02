import 'dart:async';

import 'package:dichvubonmua/res/colors.dart';
import 'package:dichvubonmua/res/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BaseView extends StatefulWidget {
  final Widget? child;
  static bool showLoading = false;

  StreamController<bool>? streamBroadcast;

  BaseView({
    @required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    if (streamBroadcast?.isClosed ?? true) {
      streamBroadcast?.close();
      streamBroadcast = null;
      streamBroadcast = new StreamController<bool>.broadcast();
    }
    return BaseViewState();
  }
}

class BaseViewState extends State<BaseView> {
  static StreamController<bool>? stream;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void didChangeDependencies() {
    if (stream?.isClosed ?? true) {
      stream = widget.streamBroadcast!;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.clBgAppBar,
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarDividerColor: Colors.white),
          child: GestureDetector(
            child: StreamBuilder<bool>(
                stream: stream!.stream,
                builder: (context, snapshot) {
                  return Stack(
                    children: [
                      widget.child!,
                      (BaseView.showLoading)
                          ? Container(
                              alignment: Alignment.center,
                              child: SpinKitPulse(
                                size: AppDimens.dp_100,
                                color: AppColor.primaryColorStart,
                              ),
                            )
                          : SizedBox()
                    ],
                  );
                }),
            onTap: () {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
//    stream?.close();
//    widget.streamBroadcast?.close();
    super.dispose();
//    ShowLoadingHud().dismissLoadingHud();
  }
}
