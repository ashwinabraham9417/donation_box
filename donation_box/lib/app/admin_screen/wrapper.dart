
import 'package:flutter/material.dart';

import 'log_in.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // return either the Home or Authenticate widget
    return LogIn();
    
  }
}