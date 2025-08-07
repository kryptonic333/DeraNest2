import 'dart:async';

import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

// The main widget is stateful to manage the timer and button states.
class OnVoiceCallScreen extends StatefulWidget {
  final String contactName;
  final String contactImageUrl;

  const OnVoiceCallScreen({
    super.key,
    this.contactName = 'Jane Doe', // Default values for demonstration
    this.contactImageUrl = AppImages.profileImage,
  });

  @override
  State<OnVoiceCallScreen> createState() => _OngoingVoiceCallScreenState();
}

class _OngoingVoiceCallScreenState extends State<OnVoiceCallScreen> {
  // State variables for the call
  late Timer _timer;
  Duration _callDuration = Duration.zero;
  bool _isMuted = false;
  bool _isSpeakerOn = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // Always cancel timers to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _callDuration = Duration(seconds: _callDuration.inSeconds + 1);
      });
    });
  }

  // Helper function to format duration into MM:SS
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  // Methods to handle user actions
  void _toggleMute() => setState(() => _isMuted = !_isMuted);
  void _toggleSpeaker() => setState(() => _isSpeakerOn = !_isSpeakerOn);
  void _endCall() {
    Navigator.pop(context);
  } 

  void _addCall() {
    /* Placeholder for add call functionality */
  }

  @override
  Widget build(BuildContext context) {
    // The main build method is clean, delegating UI to smaller widgets.
    return Scaffold(
      body: Container(
        // An attractive gradient background using your app's colors.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kSecondarySupport, AppColors.kAbortColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CallHeader(
                  contactName: widget.contactName,
                  callStatus: _formatDuration(_callDuration),
                ),
                _ContactAvatar(imageUrl: widget.contactImageUrl),
                _ActionButtons(
                  isMuted: _isMuted,
                  isSpeakerOn: _isSpeakerOn,
                  onMute: _toggleMute,
                  onSpeaker: _toggleSpeaker,
                  onAddCall: _addCall,
                  onEndCall: _endCall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// A widget for the header section (Name and Call Status/Timer).
class _CallHeader extends StatelessWidget {
  final String contactName;
  final String callStatus;

  const _CallHeader({required this.contactName, required this.callStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          contactName,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          callStatus,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.kWhite.withAlpha(100),
          ),
        ),
      ],
    );
  }
}

// A widget for the contact's avatar with a subtle pulsing effect.
class _ContactAvatar extends StatelessWidget {
  final String imageUrl;
  const _ContactAvatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kWhite.withAlpha(50),
          ),
        ),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kWhite.withAlpha(50),
          ),
        ),
        CircleAvatar(
          radius: 60,
          backgroundColor: AppColors.kPrimary,
          backgroundImage: AssetImage(imageUrl),
        ),
      ],
    );
  }
}

// A widget that lays out all the action buttons.
class _ActionButtons extends StatelessWidget {
  final bool isMuted;
  final bool isSpeakerOn;
  final VoidCallback onMute;
  final VoidCallback onSpeaker;
  final VoidCallback onAddCall;
  final VoidCallback onEndCall;

  const _ActionButtons({
    required this.isMuted,
    required this.isSpeakerOn,
    required this.onMute,
    required this.onSpeaker,
    required this.onAddCall,
    required this.onEndCall,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _CallActionButton(
              icon: isMuted ? Icons.mic_off : Icons.mic,
              label: 'Mute',
              onPressed: onMute,
              isActive: isMuted,
            ),
            _CallActionButton(
              icon: Icons.volume_up,
              label: 'Speaker',
              onPressed: onSpeaker,
              isActive: isSpeakerOn,
            ),
            _CallActionButton(
              icon: Icons.add_ic_call,
              label: 'Add call',
              onPressed: onAddCall,
            ),
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: onEndCall,
            backgroundColor: AppColors.kRed,
            elevation: 0,
            child: const Icon(
              Icons.call_end,
              color: AppColors.kWhite,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}

// A reusable widget for a single, circular action button.
class _CallActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isActive;

  const _CallActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? AppColors.kWhite.withAlpha(60)
                  : AppColors.kWhite.withAlpha(50),
            ),
            child: Icon(icon, color: AppColors.kWhite, size: 30),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(color: AppColors.kWhite, fontSize: 14),
        ),
      ],
    );
  }
}
