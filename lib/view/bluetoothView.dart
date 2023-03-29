import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import '../theme/theme.dart';
import '../widget/ActionButton.dart';
import '../widget/HeaderNavigationView.dart';

class BluetoothConnectionWidget extends StatefulWidget {
  @override
  _BluetoothConnectionWidgetState createState() =>
      _BluetoothConnectionWidgetState();
}

class _BluetoothConnectionWidgetState extends State<BluetoothConnectionWidget> {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> _devicesList = [];
  late BluetoothDevice _device;
  late StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;

  @override
  void initState() {
    super.initState();
    _getBondedDevices();
  }

  void _getBondedDevices() {
    _bluetooth.getBondedDevices().then((List<BluetoothDevice> devices) {
      setState(() {
        _devicesList = devices;
      });
    });
  }

  void _connectToDevice() async {
    if (_device != null) {
      try {
        await BluetoothConnection.toAddress(_device.address);
        print('Connected to the device');
      } catch (e) {
        print(e.toString());
      }
    } else {
      print('No device selected!');
    }
  }

  void _startDiscovery() {
    _streamSubscription = _bluetooth.startDiscovery().listen((r) {
      setState(() {
        _devicesList.add(r.device);
      });
    });
  }

  void _resetDiscovery() {
    if (_streamSubscription != null) {
      _streamSubscription!.cancel();
    }
    _bluetooth.cancelDiscovery();
    setState(() {
      _devicesList = [];
    });
    _startDiscovery();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmokeHelper',
      home: Scaffold(
        backgroundColor: CustomTheme.bgWhiteColor,
        appBar: HeaderNavigationView(pageName: "Bluetooth", parentContext: context, isHomePage: false),
        body: Column(
          children: [
            const SizedBox(height: 15.0),
            ActionButton(
              textButton: "Actualiser",
              width: 120,
              height: 30,
              fontSize: 12,
              onPressed: (){
                _resetDiscovery();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _devicesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_devicesList[index].name ?? 'Unknown device'),
                    subtitle: Text(_devicesList[index].address),
                    onTap: () {
                      setState(() {
                        _device = _devicesList[index];
                      });
                      _connectToDevice();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
