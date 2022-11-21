import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Screen<T> extends GetView<T> {
  final PreferredSizeWidget? appBar;

  Screen({
    super.key, 
    this.appBar, 
  });

  final ScrollController _scrollController = ScrollController();

  Widget builder(BuildContext context, ThemeData theme, ScrollController scroll);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: builder(context, Theme.of(context), _scrollController),
      ),
    );
  }
}