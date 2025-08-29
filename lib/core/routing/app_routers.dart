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
import 'package:deranest/features/messages/data/model/conversation_model.dart';
import 'package:deranest/features/messages/presentation/screens/poll/poll_creation_screen.dart';
import 'package:deranest/features/messages/presentation/screens/stream/conversation_screen.dart';
import 'package:deranest/features/messages/presentation/screens/stream/inbox_screen.dart';
import 'package:deranest/features/notification/presentation/notification_screen.dart';
import 'package:deranest/features/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:deranest/features/posts/data/model/post_detail_model.dart';
import 'package:deranest/features/posts/presentation/screens/content_type_selection_screen.dart';
import 'package:deranest/features/posts/presentation/screens/post_detail_screen.dart';
import 'package:deranest/features/profile/data/model/profile_model.dart';
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
import 'package:deranest/features/stories/presentation/story_media_picker_screen.dart';
import 'package:deranest/features/stories/presentation/story_viewer_screen.dart';
import 'package:deranest/features/user_discovery/presentation/user_discovery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Route paths as constants
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
  static const String postDetail = '/postDetail';
  static const String contentTypeSelect = '/contentTypeSelect';
  static const String profile = '/profile';
  static const String setting = '/setting';
  static const String userDiscovery = '/userDiscovery';
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

// Routing Setup
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.splash,
    routes: [
      // Splash
      GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
      // Login
      GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
      // Welcome
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => WelcomeScreen(),
      ),
      // Signup
      GoRoute(
        path: Routes.register,
        builder: (context, state) => SignupScreen(),
      ),
      // Terms And Conditions
      GoRoute(
        path: Routes.termsCondition,
        builder: (context, state) => TermsAndConditionsScreen(),
      ),
      // Forgot Password
      GoRoute(
        path: Routes.forgotPass,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      // Onboard
      GoRoute(
        path: Routes.onBoard,
        builder: (context, state) => OnboardingScreen(),
      ),
      // Users on App - User Discovery
      GoRoute(
        path: Routes.userDiscovery,
        builder: (context, state) => UserDiscoveryScreen(),
      ),
      // -------Screens with Persistent View-------
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainTabScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              // Feed
              GoRoute(
                path: Routes.feed,
                builder: (context, state) => MainFeedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              // Inbox
              GoRoute(
                path: Routes.inbox,
                builder: (context, state) => InboxScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              // Story/Post
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
              // Profile
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              // Notification
              GoRoute(
                path: Routes.notification,
                builder: (context, state) => NotificationScreen(),
              ),
            ],
          ),
        ],
      ),

      // Email Notification
      GoRoute(
        path: Routes.emailNotification,
        builder: (context, state) => EmailNotificationScreen(),
      ),
      // Push Notification
      GoRoute(
        path: Routes.pushNotification,
        builder: (context, state) => PushNotificationScreen(),
      ),
      // Privacy And Security
      GoRoute(
        path: Routes.privacySecurity,
        builder: (context, state) => PrivacySecurityScreen(),
      ),
      //  Help and Support
      GoRoute(
        path: Routes.helpSupport,
        builder: (context, state) => HelpSupportScreen(),
      ),
      // About
      GoRoute(path: Routes.about, builder: (context, state) => AboutScreen()),
      // Story Camera
      GoRoute(
        path: Routes.storyCamera,
        builder: (context, state) => StoryCameraScreen(),
      ),
      // Edit Profile
      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) => EditProfileScreen(),
      ),
      // Setting
      GoRoute(
        path: Routes.setting,
        builder: (context, state) => SettingsScreen(),
      ),
      // Change Password
      GoRoute(
        path: Routes.changePassword,
        builder: (context, state) => ChangePasswordScreen(),
      ),
      // Post Detail
      GoRoute(
        path: Routes.postDetail,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final post = extras['post'] as PostDetailModel;
          final index = extras['index'] as int;

          return PostDetailScreen(post: post, index: index);
        },
      ),
      // Poll Create
      GoRoute(
        path: Routes.pollCreate,
        builder: (context, state) => PollCreationScreen(),
      ),
      // Story Media Picker
      GoRoute(
        path: Routes.storyMediaPicker,
        builder: (context, state) {
          final profile = state.extra as Profile;
          return StoryMediaPickerScreen(profile: profile);
        },
      ),
      // Story Viewer
      GoRoute(
        path: Routes.storyViewer,
        builder: (context, state) => StoryViewerScreen(),
      ),
      // On Video Call
      GoRoute(
        path: Routes.onVideoCall,
        builder: (context, state) => OnVideoCallScreen(),
      ),
      // On Voice Call
      GoRoute(
        path: Routes.onVoiceCall,
        builder: (context, state) => OnVoiceCallScreen(),
      ),
      // Incoming Video Call
      GoRoute(
        path: Routes.incomingVideoCall,
        builder: (context, state) => IncomingVideoCallScreen(),
      ),
      // Incoming Voice Call
      GoRoute(
        path: Routes.incomingVoiceCall,
        builder: (context, state) => IncomingVoiceCallScreen(),
      ),
      // Conversation
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
