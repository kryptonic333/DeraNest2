import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/authentication/presentation/forgot_screen.dart';
import 'package:deranest/features/authentication/presentation/login_screen.dart';
import 'package:deranest/features/authentication/presentation/signup_screen.dart';
import 'package:deranest/features/authentication/presentation/terms_and_conditions.dart';
import 'package:deranest/features/authentication/presentation/welcome_screen.dart';
import 'package:deranest/features/call/presentation/video_call_screen/incoming_video_call_screen.dart';
import 'package:deranest/features/call/presentation/video_call_screen/on_video_call_screen.dart';
import 'package:deranest/features/call/presentation/voice_call_screen/incoming_voice_call_screen.dart';
import 'package:deranest/features/call/presentation/voice_call_screen/on_voice_call_screen.dart';
import 'package:deranest/features/feed/presentation/screens/feed_screen.dart';
import 'package:deranest/features/main_tab/presentation/screens/main_tab_screen.dart';
import 'package:deranest/features/messages/presentation/poll/poll_creation_screen.dart';
import 'package:deranest/features/messages/presentation/stream/conversation_screen.dart';
import 'package:deranest/features/messages/presentation/stream/inbox_screen.dart';
import 'package:deranest/features/notification/presentation/notification_screen.dart';
import 'package:deranest/features/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:deranest/features/posts/presentation/screens/content_type_selection_screen.dart';
import 'package:deranest/features/posts/presentation/screens/post_detail_screen.dart';
import 'package:deranest/features/posts/presentation/screens/post_gallery_screen.dart';
import 'package:deranest/features/profile/presentation/profile_screen.dart';
import 'package:deranest/features/settings/presentation/screens/about_screen.dart';
import 'package:deranest/features/settings/presentation/screens/change_pass.dart';
import 'package:deranest/features/settings/presentation/screens/edit_profile.dart';
import 'package:deranest/features/settings/presentation/screens/email_notification.dart';
import 'package:deranest/features/settings/presentation/screens/help_n_support.dart';
import 'package:deranest/features/settings/presentation/screens/privacy_n_security.dart';
import 'package:deranest/features/settings/presentation/screens/push_notification.dart';
import 'package:deranest/features/settings/presentation/screens/setting_screen.dart';
import 'package:deranest/features/splash/presentation/screens/splash_screen.dart';
import 'package:deranest/features/stories/presentation/story_camera_screen.dart';
import 'package:deranest/features/stories/presentation/story_media_gallery_screen.dart';
import 'package:deranest/features/stories/presentation/story_media_picker_screen.dart';
import 'package:deranest/features/stories/presentation/story_viewer_screen.dart';
import 'package:deranest/features/user_discovery/presentation/user_discovery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Defines all route paths as constants
class Routes {
  static const String splash = '/';
  static const String termsCondition = '/termsCondition';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String register = '/register';
  static const String forgotPass = '/forgotPass';
  static const String onBoard = '/onBoard';
  static const String feed = '/feed';

  static const String conversation = '/conversation';
  static const String inbox = '/inbox';
  static const String pollCreate = '/poll';
  static const String notification = '/notification';
  static const String postGallery = '/phoneGallery';
  static const String postDetail = '/postDetail';
  static const String contentTypeSelect = '/contentTypeSelect';
  static const String profile = '/profile';
  static const String setting = '/setting';
  static const String userDiscovery = '/userDiscovery';
  static const String storyMediaGallery = '/storyMediaGallery';
  static const String storyCamera = '/storyCamera';
  static const String storyMediaPicker = '/storyMediaPicker';
  static const String storyViewer = '/storyViewer';
  static const String onVideoCall = '/onVideoCall';
  static const String onVoiceCall = '/onVoiceCall';
  static const String incomingVideoCall = '/incomingVideoCall';
  static const String incomingVoiceCall = '/incomingVoiceCall';
  static const String changePassword = '/changePassword';
  static const String about = '/about';
  static const String editProfile = '/editProfile';
  static const String privacySecurity = '/privacySecurity';
  static const String helpSupport = '/helpSupport';
  static const String pushNotification = '/pushNotification';
  static const String emailNotification = '/emailNotification';
}

// Global navigator key
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

// Routing setup using GoRouter and Riverpod
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.splash,
    routes: [
      // --- Auth and splash outside of tabs ---
      GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
      GoRoute(path: Routes.welcome, builder: (context, state) => AskUserAuth()),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: Routes.termsCondition,
        builder: (context, state) => TermsAndConditionsScreen(),
      ),
      GoRoute(
        path: Routes.forgotPass,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.onBoard,
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(
        path: Routes.userDiscovery,
        builder: (context, state) => UserDiscoveryScreen(),
      ),
      // Screens with Persistent View
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainTabScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.feed,
                builder: (context, state) => MainFeedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.inbox,
                builder: (context, state) => InboxScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.contentTypeSelect,
                builder: (context, state) {
                  return ContentTypeSelectionScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.notification,
                builder: (context, state) => NotificationScreen(),
              ),
            ],
          ),
        ],
      ),
      // Other App Screens
      GoRoute(
        path: Routes.postGallery,
        builder: (context, state) => PostGalleryScreen(),
      ),

      GoRoute(
        path: Routes.emailNotification,
        builder: (context, state) => EmailNotificationScreen(),
      ),
      GoRoute(
        path: Routes.pushNotification,
        builder: (context, state) => PushNotificationScreen(),
      ),
      GoRoute(
        path: Routes.privacySecurity,
        builder: (context, state) => PrivacySecurityScreen(),
      ),
      GoRoute(
        path: Routes.helpSupport,
        builder: (context, state) => HelpSupportScreen(),
      ),
      GoRoute(path: Routes.about, builder: (context, state) => AboutScreen()),
      GoRoute(
        path: Routes.storyCamera,
        builder: (context, state) => StoryCameraScreen(),
      ),
      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: Routes.setting,
        builder: (context, state) => SettingsScreen(),
      ),
      GoRoute(
        path: Routes.storyMediaGallery,
        builder: (context, state) => StoryMediaGalleryScreen(),
      ),
      GoRoute(
        path: Routes.changePassword,
        builder: (context, state) => ChangePasswordScreen(),
      ),
      GoRoute(
        path: Routes.postDetail,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final post = extras['post'] as PostDetailModel;
          final index = extras['index'] as int;

          return PostDetailScreen(post: post, index: index);
        },
      ),
      GoRoute(
        path: Routes.pollCreate,
        builder: (context, state) => PollCreationScreen(),
      ),
      GoRoute(
        path: Routes.storyMediaPicker,
        builder: (context, state) {
          final profile = state.extra as Profile;
          return StoryMediaPickerScreen(profile: profile);
        },
      ),
      GoRoute(
        path: Routes.storyViewer,
        builder: (context, state) => StoryViewerScreen(),
      ),
      GoRoute(
        path: Routes.onVideoCall,
        builder: (context, state) => OnVideoCallScreen(),
      ),
      GoRoute(
        path: Routes.onVoiceCall,
        builder: (context, state) => OnVoiceCallScreen(),
      ),
      GoRoute(
        path: Routes.incomingVideoCall,
        builder: (context, state) => IncomingVideoCallScreen(),
      ),
      GoRoute(
        path: Routes.incomingVoiceCall,
        builder: (context, state) => IncomingVoiceCallScreen(),
      ),

      GoRoute(
        path: Routes.conversation,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final profile = extras['profile'] as Profile;
          final conversation = extras['conversation'] as Conversation;
          return ConversationScreen(
            conversation: conversation,
            currentUser: profile,
          );
        },
      ),
    ],
  );
});
