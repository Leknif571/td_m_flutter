import 'dart:math';
import '../model/model_casino_result.dart';
import '../model/model_casino_table_return.dart';

class CasinoLogic {
  ModelCasino onPlay(ModelCasinoTableReturn allList) {
    if (allList.resultRandom[0] == allList.resultRandom[1] &&
        allList.resultRandom[1] == allList.resultRandom[2]) {
      if (allList.resultRandom[0] == allList.listImage[6]) {
        return ModelCasino("Méga Jackpot !!!", true, true);
      }
      return ModelCasino("jackpot", true, false);
    } else {
      return ModelCasino("You loose ! Try again", true, false);
    }
  }

  Map<int, String?> returnTable(List listImage) {
    Map<int, String?> indexMap = {};
    indexMap.clear();
    for (int i = 0; i < 3; i++) {
      Random r = Random();
      /* pour tester aléatoire */
      int index = r.nextInt(7);
      /* Pour tester victoire normal*/
      // int index = 1;
      /* Pour tester victoire jackpot */
      // int index = 6;
      indexMap.addAll({i: listImage[index]});
    }
    return indexMap;
  }
}
