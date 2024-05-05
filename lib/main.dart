import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor/Constraints.dart';
import 'package:vendor/StorageStream.dart';
import 'package:vendor/screens/splashscreen.dart';
import 'NotificationSetup/helper_Notification.dart';
import 'Registration Pages/setyourProfile.dart';
import 'StateManagement/PageBloc.dart';
import 'firebase_options.dart';



// on kill state
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("App Background...${message.data}");
  NotificationServices.display(message,"404");

}

// on background
@pragma('vm:entry-point')
Future<void> firebaseMessagingonmessageHandler(RemoteMessage message) async {
  NotificationServices.display(message,"404");
  print("App Background...${message.data}");

}
@pragma('vm:entry-point')
Future<void> firebaseMessagingonmessageOpenedAppHandler(RemoteMessage message) async {

  print("App onend...${message.data}");
  NotificationServices.display(message,"404");

}

Future<void> main() async {
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final box =GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userToken=box.read("UserToken").toString();
    NotificationServices.initialize(context);

    FirebaseMessaging.onMessage.listen(firebaseMessagingonmessageHandler);

    FirebaseMessaging.onBackgroundMessage.call(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(firebaseMessagingonmessageOpenedAppHandler);

  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider<AddProductBlo>(
          create: (BuildContext context) => AddProductBlo(),
        ),
        BlocProvider<AddServiceBlo>(
          create: (BuildContext context) => AddServiceBlo(),
        ),
        BlocProvider<AddTimerBlo>(
          create: (BuildContext context) => AddTimerBlo(),
        ),
        BlocProvider<QuotesBlo>(
          create: (BuildContext context) => QuotesBlo(),
        ),
        BlocProvider<AddOnBlo>(
          create: (BuildContext context) => AddOnBlo(),
        ),
        BlocProvider<GraphBlo>(
          create: (BuildContext context) => GraphBlo(),
        ),
        BlocProvider<ProductOrderBlo>(
          create: (BuildContext context) => ProductOrderBlo(),
        ),
        BlocProvider<ServiceOrderBlo>(
          create: (BuildContext context) =>ServiceOrderBlo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
        userToken!="null"
          ?
            const StorageStream()
            :
        const SplashScreen(),
       // CheckConnection()

      ),
    );
  }
}

