import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

const iPhone5_5 =
    Device(size: Size(414, 736), name: 'iPhone5.5', devicePixelRatio: 3.0);
const iPad12_9 =
    Device(size: Size(1366, 1024), name: 'iPad12.9', devicePixelRatio: 2.0);

List<Device> kDevices = [iPhone5_5, iPad12_9];
