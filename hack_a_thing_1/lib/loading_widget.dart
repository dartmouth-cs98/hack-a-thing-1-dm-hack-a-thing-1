import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({@required this.loadingText}) : super();
  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: _buildLoadingWidget(),
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 20,
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircularProgressIndicator(),
          Text(
            loadingText.toUpperCase(),
            style: new TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
