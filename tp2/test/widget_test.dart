import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp2/logic_metier/body_mass_index_logic.dart';
import 'package:tp2/page/body_mass_index_less.dart';

void main() {
  testWidgets('IMC calcul test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final tailleField = find.byKey(const Key('_tailleField'));
    final poidsField = find.byKey(const Key('_poidsField'));

    await tester.enterText(tailleField, "170");
    await tester.enterText(poidsField, "55");

    await tester.tap(find.byIcon(Icons.verified));
    await tester.pumpAndSettle();

    expect(find.text('Normal'), findsOneWidget);
  });

  test('IMC fonction de retour du calcule', () {
    final imc = BodyMassIndexLogic();
    expect(imc.calculateImc(50, 170), 17.301038062283737);
  });

  test('IMC fonction de retour post calcule', () {
    final category = BodyMassIndexLogic();
    expect(category.getCategory(24), "Normal");
  });
}
