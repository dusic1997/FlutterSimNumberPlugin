# SimNumber plugin for Flutter

A Flutter plugin to retrieve Sim cards data - dual sim support.

Note: It works for Android only because getting mobile number of sim card is not supported in iOS.

Note: If the mobile number is not pre-exist on sim card it will return sim slot index and operator name.

## Installation

Add `simnumber` as a dependency in your pubspec.yaml.

Make sure that your `AndroidManifext.xml` file includes the following permission:
```xml
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.READ_PHONE_NUMBERS" />
```

### Usage

Before you use this plugin, you must make sure that the user has authorized access to his phone, for example with the [permission_handler plugin](https://pub.dev/packages/permission_handler).

You may then use the plugin:
``` dart
import 'package:simnumber/sim_number.dart';

void printSimCardsData() async {
  try {
    SimInfo simInfo = await SimNumber.getSimData();
    for (var s in simInfo.cards) {
      print('Serial number: ${s.slotIndex} ${s.phoneNumber}');
    }
  } on Exception catch (e) {
    debugPrint("error! code: ${e.code} - message: ${e.message}");
  }
}

void main() => printSimCardsData();
```
