import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jinjicouple/widgets/post_app_bar.dart';
import 'package:jinjicouple/widgets/post_bottom_bar.dart';

class PostScreen extends StatelessWidget {
  Map post;
  PostScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(post['image']),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: PostAppBar(),
          ),
          bottomNavigationBar: PostBottomBar(
            name: post['name'],
            content:
                '입동이 벌써 지났다. 두 주가 지난 그 숲은 아직 뾰족하고 가늘게 날카로운 초록잎들이 조심스레 나스락거리고 있었다. 그 틈 단풍나무의 붉은빛과 상수리나무의 진노랑빛은 가을 추억을 더욱 익어가게 한다. 그렇게 온통 하늘을 가리는 소나무들은 빛바랜 노란빛을 슬쩍 비친다. 그러다 스치는 바람에 엽록소를 버린 윤기조차 잃어버린 채 힘없이 매달린 바늘잎들이 스르르 떨군다. 또한, 매몰차게도 몰아치는 바람이 야속하기까지 할 수도. 이내 잎비로 쏟아져 내린다. 따끔거리며 내려앉더니 투박한 내 안경 위로도 걸쳐진다. 두 장의 소나무 잎이 말이다. 한참을 쪼개진 빛처럼 부서져 내리는 소나무 낙엽을 내 눈 속에 담아본다.',
          ),
        ),
      ),
    );
  }
}
