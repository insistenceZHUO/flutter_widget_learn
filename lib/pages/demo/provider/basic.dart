import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_details/pages/demo/provider/BasicModal.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  late BasicModal _modelView;
  @override
  void initState() {
    super.initState();
    _modelView = BasicModal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => _modelView,
            child: Builder(builder: (context) {
              return ListView(
                children: [
                  buildRow(context),
                  Divider(),
                  ElevatedButton(onPressed: () {}, child: Text('Selector')),
                  buildBuilder(),
                  // Text('')
                ],
              );
            })));
  }

  Builder buildBuilder() {
    return Builder(builder: (context) {
      return Selector<BasicModal, int>(
          builder: (ctx, c, child) => Text('Selector:${c}'),
          selector: (ctx, c) => _modelView.count);
    });
  }

  Builder buildRow(BuildContext context) {
    return Builder(builder: (context) {
      return Row(
        children: <Widget>[
          TextButton(
              onPressed: () {
                _modelView.add();
              },
              child: Text('点击加+1')),
          Text('${context.watch<BasicModal>().count}'),
          TextButton(
              onPressed: () {
                _modelView.subtraction();
              },
              child: Text('点击-1')),
        ],
      );
    });
  }
}

class MyLessWidget extends StatelessWidget {
  const MyLessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
