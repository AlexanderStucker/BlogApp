import 'package:blog_app/screens/entry_screen.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/create_blog_screen.dart';
import 'package:blog_app/screens/blog_detail_screen.dart';

var appRoutes = {
  '/': (context) => const EntryScreen(),
  '/home': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
 '/create': (context) => CreateBlogScreen(onBlogCreated: () {  },),
  // '/detail': (context) => const BlogDetailScreen(),
};