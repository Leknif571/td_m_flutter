import 'dart:math';
import '../model/model_casino_result.dart';
import '../model/model_casino_table_return.dart';

class CasinoLogic {
  DtoCasino onPlay(DtoRetrunTableCasino allList) {
    if (allList.resultRandom[0] == allList.resultRandom[1] &&
        allList.resultRandom[1] == allList.resultRandom[2]) {
      if (allList.resultRandom[0] == allList.listImage[6]) {
        return DtoCasino("Méga Jackpot !!!", true, false);
      }
      return DtoCasino("jackpot", true, false);
    } else {
      return DtoCasino("You loose ! Try again", true, false);
    }
  }

  Map<int, String?> returnTable(List listImage) {
    Map<int, String?> indexMap = {};
    indexMap.clear();
    for (int i = 0; i < 3; i++) {
      Random r = Random();
      int index = r.nextInt(7);
      indexMap.addAll({i: listImage[index]});
    }
    return indexMap;
  }
}
