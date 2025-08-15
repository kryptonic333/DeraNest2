import 'package:deranest/core/presentation/widgets/custom_text_button.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomingVoiceCallScreen extends StatelessWidget {
  const IncomingVoiceCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextButton(text:'Incoming Voice Call',onPressed:() => context.push(Routes.onVoiceCall),),
      ),
    );
  }
}