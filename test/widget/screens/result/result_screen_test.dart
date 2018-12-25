// Copyright (c) 2018, The Bnoggles Team.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import 'package:bnoggles/screens/result/result_screen.dart';
import 'package:bnoggles/screens/result/widgets/all_words_list.dart';
import 'package:bnoggles/screens/result/widgets/result_action_row.dart';
import 'package:bnoggles/screens/result/widgets/result_board.dart';
import 'package:bnoggles/screens/result/widgets/score_overview.dart';
import 'package:bnoggles/utils/game_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../widget_test_helper.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'find '
      'Bnoggles, AllWordsList, ScoreOviewview, ResultBoard, ResultActionRow',
      (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(768, 1024));

    GameInfo info = createGameInfo();
    ResultScreen screen = ResultScreen(
      gameInfo: info,
    );

    Widget w = testableWidgetWithMediaQuery(
      child: screen,
      width: 768,
      height: 1024,
    );
    await tester.pumpWidget(w);

    expect(find.text("Bnoggles"), findsOneWidget);
    expect(find.byType(AllWordsList), findsOneWidget);
    expect(find.byType(ScoreOverview), findsOneWidget);
    expect(find.byType(ResultBoard), findsOneWidget);
    expect(find.byType(ResultActionRow), findsOneWidget);
  });
}