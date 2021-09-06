import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/providers/alert_dialog.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = AppDio.getInstance(ref);
  ref.onDispose(() {
    dio.close();
  });
  return dio;
});

class AppDio with DioMixin implements Dio {
  final ProviderReference ref;

  AppDio._(this.ref, [BaseOptions? options]) {
    options = BaseOptions(
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    // this.interceptors.add(InterceptorsWrapper(
    //     onRequest: (requestOptions, handler) async{
    //       var token = await ref.read(storageProvider).read(key: 'token');
    //       Map tokenHeader = new Map<String, String>();
    //       if (token != null){
    //         tokenHeader['Authorization'] = 'Bearer' + token.toString();
    //         requestOptions.headers.addAll(tokenHeader as Map<String, dynamic>);
    //       }
    //
    //       return handler.next(requestOptions);
    //     },
    //     onError: (requestOptions, handler){
    //       // print('Error...');
    //       // return handler.next(requestOptions);
    //       Get.dialog(AlertDialogs("message"));
    //       // Fluttertoast.showToast(
    //       //     msg: "Something went wrong, please try again",
    //       //     toastLength: Toast.LENGTH_SHORT,
    //       //     gravity: ToastGravity.BOTTOM,
    //       //     timeInSecForIosWeb: 1,
    //       //     backgroundColor: Colors.red,
    //       //     textColor: Colors.white,
    //       //     fontSize: 16.0);
    //       return handler.next(requestOptions);
    //     },
    //     onResponse: (requestOptions, handler){
    //       var temp = requestOptions.data;
    //       requestOptions.data = temp;
    //       return handler.next(requestOptions);
    //     }
    // ));


    this.interceptors.add(InterceptorsWrapper(
        onRequest: (requestOptions, handler) async{
          var token = await ref.read(storageProvider).read(key: 'token');
          Map tokenHeader = new Map<String, String>();
          if (token != null) {
            tokenHeader['Authorization'] = 'Bearer ' + token.toString();
            requestOptions.headers.addAll(tokenHeader as Map<String, dynamic>);
          }

          return handler.next(requestOptions);
        },
        onError: (requestOptions, handler){
          print('error woy');
          Get.dialog(AlertDialogs(requestOptions.error));
          // Get.defaultDialog(
          //   title: "CEK ERROR",
          //     middleText: "Hello world!",
          //     backgroundColor: Colors.green,
          //     titleStyle: TextStyle(color: Colors.white),
          //     middleTextStyle: TextStyle(color: Colors.white),
          //     textConfirm: "Confirm",
          //     textCancel: "Cancel",
          //     cancelTextColor: Colors.white,
          //     confirmTextColor: Colors.white,
          //     buttonColor: Colors.red,
          //     barrierDismissible: false,
          //     radius: 50,
          //     content: Column(
          //       children: [
          //         Container(child:Text("Hello 1")),
          //         Container(child:Text("Hello 2")),
          //         Container(child:Text("Hello 3")),
          //       ],
          //     )
          // );
          return handler.next(requestOptions);
        },
        onResponse: (requestOptions, handler){
          var temp = requestOptions.data;
          requestOptions.data = temp;

          return handler.next(requestOptions);
        }
    ));


    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance(ProviderReference ref) => AppDio._(ref);
}