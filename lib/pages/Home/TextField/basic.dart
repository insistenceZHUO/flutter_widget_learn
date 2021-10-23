import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    //  获取焦点
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print('获取焦点');
      } else {
        print('失去焦点');
      }
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    super.dispose();
  }

  TextStyle get commonTextStyle => TextStyle(
        color: Colors.blueAccent,
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 18 / 16,
        textBaseline: TextBaseline.ideographic,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('textField'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('---------------- Decroation ------------'),
          ),
          Container(child: buildTextField()),
          SizedBox(
            height: 30,
          ),
          Divider(),
          Container(
            height: 42,
            // alignment: Alignment.center,
            child: TextField(
              focusNode: _focusNode, // 焦点控制属性
              controller: _controller, // 文本框控制属性
              textInputAction: TextInputAction.search, // 弹出键盘的类型
              cursorHeight: 16,
              cursorWidth: 2,
              cursorRadius: Radius.circular(1),
              style: commonTextStyle,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: commonTextStyle,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.add),
                // // 设置输入框左边的图标
                // prefixIcon: Container(
                //   child: IconButton(
                //     icon: SvgPicture.asset(
                //       Assets.assets_svg_ic_search_svg,
                //       color: appColors.textColor4,
                //     ),
                //     onPressed: () {},
                //     padding: EdgeInsets.zero,
                //     constraints: BoxConstraints.tightFor(width: 24, height: 24),
                //     splashRadius: 28,
                //   ),
                // ),
                //
                // suffixIcon: _focusNode.hasFocus ||
                //         (!_focusNode.hasFocus && _controller.text.isNotEmpty)
                //     ? IconButton(
                //         icon: SvgPicture.asset(
                //           Assets.assets_svg_close_svg,
                //           color: appColors.textColor4,
                //         ),
                //         onPressed: () {
                //           _focusNode.unfocus();
                //           _controller.text = '';
                //           setState(() {
                //             _idEntry = false;
                //           });
                //         },
                //         padding: EdgeInsets.zero,
                //         constraints:
                //             BoxConstraints.tightFor(width: 24, height: 24),
                //         splashRadius: 28,
                //       )
                //     : null,
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xff333333)),
                borderRadius: BorderRadius.circular(12)),
          )
        ],
      ),
    );
  }

  TextField buildTextField() {
    return TextField(
      focusNode: _focusNode, // 焦点控制
      controller: _controller, // 控制器，可以控制 textField 的输入内容，也可以监听 textField 改变
      textInputAction: TextInputAction.search, // 键盘类型
      // keyboardType:,
      textCapitalization:
          TextCapitalization.characters, // 大小写，默认为 TextCapitalization.none
      style: TextStyle(
        color: Colors.blueAccent,
      ), // 输入文字的字体样式
      // strutStyle:, // 字体的布局
      textAlign: TextAlign.center, // 输入文本的起始位置 默认start
      // textAlignVertical // 文字纵轴对齐方式
      // textDirection:,  //  TextDirection.ltr 是居左，TextDirection.rtl 是居右，和 textAlign 效果一致
      // readOnly: false, // 只读属性，设置为true后，输入框禁止输入
      // toolbarOptions: ,
      decoration: InputDecoration(
        icon: Icon(Icons.supervised_user_circle),
        labelText: '用户', // 提示语，位于输入框上方
        labelStyle: TextStyle(), // 提示语样式
        helperText: '请输入', // 辅助文本，位于输入框下方，errorText 为空时显示
        helperStyle: TextStyle(), // 辅助文本样式 TextStyle
        helperMaxLines: 2, // 辅助文本最大展示行数
        hintText: '请输入', // 占位文本，位于输入框光标后，输入内容为空时展示,
        hintStyle: TextStyle(), // 占位文本样式 TextStyle
        errorText: '出错了 - errorText', // 出错文本，位于输入框下方
        errorStyle: TextStyle(), // 出错时，文本的样式。
        errorMaxLines: 2, // 出错时，文本占用的最大展示行数。
        //  floatingLabelBehavior |FloatingLabelBehavior，
        //  auto : labelText  显示在输入框中，当开始输入时，会有一个动画，字体变小并显示在输入框上方。
        //  never : labelText 显示在输入框中，当开始输入时，labelText 隐藏。
        //  always: LabelText 永远显示在最上方。
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: false, //  输入框是否为密集形式，默认为false
        contentPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0), // 内间距，默认值与 border 以及 isDense 有关，下方会贴源码备注
        prefixIcon: Icon(Icons.card_membership), // 头部图标，位于输入框内部最左侧 // prefix
        // prefixIconConstraints:, // 头部图标盒约束
        prefix:
            Text('头部'), // 头部组件 Widget，位于光标左侧，与 prefixText 不能同时使用, 输入框获取焦点后才会显示
        // prefixText: '头部', // 头部文本，位于光标左侧，与 prefix 不能同时使用
        prefixStyle: TextStyle(), // 头部文本样式 TextStyle

        suffixIcon: Icon(Icons.card_membership), // 尾部图标
        suffix: Text(
            '尾部'), //// 尾部组件 Widget，位于光标左侧，与 prefixText 不能同时使用, 输入框获取焦点后才会显示
        suffixStyle: TextStyle(),
        // suffixText: '尾部',
        // suffixIconConstraints:, // 尾部图标盒约束，效果不是很明显

        counter: Container(
          width: 10,
          height: 10,
          color: Colors.blue,
        ), // 备注组件 Widget，位于输入框右下角外侧，与 counterText 不能同时使用
        counterText: '备注文本',
        counterStyle: TextStyle(),
        filled: true, // 是否填充
        fillColor: Colors.black12, // 填充的颜色

        focusColor: Colors.blueAccent, // 聚焦色
        hoverColor: Colors.red, // 鼠标悬停色

        // border: InputBorder.none, 取消下边框
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Colors.red, width: 3.0, style: BorderStyle.solid)), //
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Colors.red,
                width: 3.0,
                style: BorderStyle.solid)), // 错误边框，errorText不为空，输入框没有焦点时显示
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Colors.red,
                width: 3.0,
                style: BorderStyle.solid)), // 输入框开始输入时的边框，errorText为空时生效
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Colors.red,
                width: 3.0,
                style: BorderStyle.solid)), // errorText不为空时，输入框有焦点时的边框
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Colors.red, width: 3.0, style: BorderStyle.solid)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Colors.red,
                width: 3.0,
                style: BorderStyle.solid)), // 输入框可用时的边框，errorText为空时生效
        enabled: true,

        // alignLabelWithHint 当 textField 为多行时，居中对齐行为，默认为 false
        // focusedBorder
      ),
      showCursor: true, // 是否显示光标
      autofocus: false, // 是否自动聚焦
      cursorWidth: 3, // 光标宽度，默认为 2.0
      cursorHeight: 10, // 光标高度
      cursorColor: Colors.green, // 光标颜色
      cursorRadius: Radius.circular(2), // 光标倒角

      obscuringCharacter: '@', // 加密输入时的替换字符，默认为 '
      obscureText: true, // 是否加密，默认为 false
      // mouseCursor: , // 鼠标悬停，Web可以了解
      // autocorrect:, // 是否自动更正
      // smartDashesType: ,// SmartDashesType 智能替换破折号，例如连续输入三个'-' 会自动替换成一个'——'，当 obseretext == true 时，smartDashesType 默认不可用
      //   smartQuotesType, // SmartQuotesType 智能替换引号，根据文字情况智能替换为左引号或者右引号，当 obseretext == true 时，SmartQuotesType 默认不可用

      // enableSuggestions, // 师傅在用户输入时候显示建议
      // maxLines: 4, // 最大行数
      // minLine: 1, // 最小行数
      // expands: false, // 是否填充父控件
      // maxLengthEnforced: true, // 是否强制限制，或者只提供字符计数器和警告，默认为 true

      onChanged: (value) {
        print('onChanged：${value}');
      }, // 输入框文字改变回调

      onEditingComplete: () {
        print(
          'onEditingComplete',
        );
      }, // 输入框完成时的回调

      onSubmitted: (value) {
        print('onSubmitted');
      }, // 提交按钮点击回调

      // inputFormatters: ,
      selectionHeightStyle: BoxHeightStyle
          .includeLineSpacingTop, // 选中高度样式，默认为 ui.BoxHeightStyle.tight

      selectionWidthStyle: BoxWidthStyle.max,
      dragStartBehavior:
          DragStartBehavior.down, //  启动阻力，默认为 DragStartBehavior.start

      enableInteractiveSelection:
          true, // 默认为True，如果为false，则大多数辅助功能支持选择文本、复制和粘贴，移动插入符号将被禁用。
      // buildCounter: InputCounterWidgetBuilder(
      //   child: Text('rwqeqeq'),
      // ), // 自定义小工具,
      // scrollPadding, // 滚动后距离边缘的距离，默认为 EdgeInsets.all(20.0)
      // scrollController // 滚动控制器
      // scrollPhysics // 滚动物理效果
      // autofillHints // 自动填充
      // 长按时弹出的按钮设置，（如赋值，粘贴，全部选中等）
    );
  }
}
