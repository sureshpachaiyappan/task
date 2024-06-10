import 'dart:io';
import 'package:flutter_keychain/flutter_keychain.dart';


class KeyChain {
  static saveToken() async {
    await FlutterKeychain.put(key: "token", value:"Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx");
  }
}


