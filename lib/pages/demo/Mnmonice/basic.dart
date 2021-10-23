import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widget_details/common/dispose.dart';

import 'EnglishMnemonice.dart';

class MnmonicePage extends StatefulWidget {
  final id;

  const MnmonicePage({required Key key, this.id = 12}) : super(key: key);
  @override
  _MnmonicePageState createState() => _MnmonicePageState();
}

class _MnmonicePageState extends State<MnmonicePage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController(text: '');
  double _opacity = 1;
  String textValue = '';
  Duration durationTime = Duration(milliseconds: 500);
  late Timer? timer;
  GlobalKey _keyGreen = GlobalKey();
  List<String> searchlist = [];

  List<String> MnemonicList = [];
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // print('完成了完成了${widget.id}');
    });
    // globalKey.currentContext.size.width
    _focusNode.addListener(() {
      print(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _controller.clear();
    timer?.cancel();
    super.dispose();
  }

  //  文本框公共的样式
  TextStyle get commonTextStyle => TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 18 / 16,
        textBaseline: TextBaseline.ideographic,
      );
  Container buildfooterMnemonicList(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xffF3F3F5), width: 1))),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...searchlist.map((e) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      MnemonicList[MnemonicList.length - 1] = e;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        alignment: Alignment.center,
                        color: Color(0xffF7F8FA),
                        child: Text('$e'),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mnemonic'),
      ),
      bottomSheet: Container(
          height: 48,
          child: buildfooterMnemonicList(
            context,
          )),
      body: buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Stack(
          // key: _keyGreen,
          children: [
            Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  key: _keyGreen,
                  constraints: BoxConstraints(
                    minHeight: 112,
                  ),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...MnemonicList.map((e) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('$e'),
                                width: 72,
                                height: 26,
                                color: Color(0xffF7F8FA),
                              ),
                            )),
                        Text(
                            '${_controller.text.substring(MnemonicList.length)}'),
                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: Duration(seconds: 2),
                          onEnd: () {},
                          child: Container(
                            // alignment: Alignment.topLeft,
                            width: 2,
                            height: 26,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: Colors.red)),
                  // child: Text(_controller.text),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: Container(
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _controller,
                      // textInputAction: TextInputAction.search, // 弹出键盘的类型
                      cursorHeight: 16,
                      cursorWidth: 2,
                      minLines: 4,
                      maxLines: 8,
                      cursorRadius: Radius.circular(1),
                      style: commonTextStyle,
                      enabled: true,
                      onChanged: (value) {
                        print('触发onchaned');
                        print(value);
                        String t = '';
                        List<String> resultSearch = [];
                        List<String> simplifyResultSearch = [];
                        searchlist = [];
                        //     _controller.text.substring(MnemonicList.length);
                        if (_controller.text.length > MnemonicList.length) {
                          // print(DisposeArray.extractFirstWordList());
                          DisposeArray.extractFirstWordList()
                              .forEach((key, value) {
                            if (_controller.text
                                    .substring(MnemonicList.length)[0] ==
                                key) {
                              resultSearch = value;
                            }
                          });
                          resultSearch.forEach((element) {
                            if (element.indexOf(_controller.text
                                    .substring(MnemonicList.length)) !=
                                -1) {
                              simplifyResultSearch.add(element);
                            }
                          });
                          setState(() {
                            searchlist.addAll(simplifyResultSearch);
                          });

                          timer?.cancel();
                          timer = new Timer(durationTime, () {
                            setState(() {
                              MnemonicList.add(_controller.text
                                  .substring(MnemonicList.length));
                              for (int i = 0; i < MnemonicList.length; i++) {
                                t += '1';
                              }
                              _controller.text = t;
                            });
                            _controller.selection = TextSelection.fromPosition(
                                TextPosition(offset: _controller.text.length));
                          });
                        }

                        if (_controller.text.length < MnemonicList.length) {
                          setState(() {
                            MnemonicList.removeLast();
                            for (int i = 0; i < MnemonicList.length; i++) {
                              t += '1';
                            }
                            _controller.text = t;
                          });
                        }

                        _controller.selection = TextSelection.fromPosition(
                            TextPosition(offset: _controller.text.length));
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16, top: 12),
                        hintText: '请输入',
                        hintStyle: commonTextStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ChildrenWidget(
          callback: (e) {
            print(e);
          },
        )
      ],
    );
  }
}

class ChildrenWidget extends StatelessWidget {
  final callback;

  var id;

  ChildrenWidget({this.id = 12, this.callback}) : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              this.callback('我是子widget传递过来的数据');
            },
            child: Text('传递父widget的数据'))
      ],
    );
  }
}
