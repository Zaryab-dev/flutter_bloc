import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/bloc_providers.dart';
import 'package:flutter_bloc_state/pages/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';

void main() async{
  await Global.init();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
            designSize: Size(375, 812),
            builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const ApplicationPages(),
            onGenerateRoute: AppPages.generateRouteSetting,
            // routes: {
            //   'signIn' : (context) => SignInScreen(),
            //   'signup' : (context) => SignUpScreen(),
            //   'applicationPages' : (context) => ApplicationPages(),
            // },
          );
        }));
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text("Flutter Bloc"),
//       ),
//       body: Center(
//         child: BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 state.counter == 0
//                     ? ''
//                     : 'You have pushed the button this ${state.counter} times:',
//               ),
//               Text(
//                 state.counter.toString(),
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           );
//         }),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             heroTag: 'hereTag1',
//             onPressed: () {
//               BlocProvider.of<AppBlocs>(context).add(Increment());
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             heroTag: 'hereTag2',
//             onPressed: () {
//               BlocProvider.of<AppBlocs>(context).add(Decrement());
//             },
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           )
//         ],
//       ),
//     );
//   }
// }
