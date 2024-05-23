import 'package:flutter/material.dart';

class AntiModal extends StatefulWidget {
  const AntiModal({super.key, this.appBar, required this.body});
  final PreferredSizeWidget? appBar;
  final Widget body;

  @override
  State<AntiModal> createState() => _AntiModalState();
}

class _AntiModalState extends State<AntiModal> {
  bool _isClose = false;
  Widget _buildContent() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dismissible(
      key: const Key('key'),
      direction: DismissDirection.vertical,
      // onDismissed: (_) => Get.back(),
      onUpdate: (details) {
        if (details.progress > 0.5) {
          setState(() {
            _isClose = true;
          });
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: height * 0.9,
        width: width,
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: widget.appBar,
          body: widget.body,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(_isClose ? 0.0 : 0.4),
      body: Container(),
      bottomSheet: _buildContent(),
    );
  }
}
