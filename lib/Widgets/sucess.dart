import 'package:flutter/material.dart';
import 'package:pap/utils/utils.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Uploaded  ${returnfiletype()}');
  }
}
