import 'package:flutter/material.dart';

class TypeModel {
  final String name;
  final String description;
  final String image;
  final Color color;

  const TypeModel({
    required this.name,
    required this.description,
    required this.image,
    required this.color,
  });
}

const List<TypeModel> typeList = [
  TypeModel(
    name: '감성형',
    description: '감성으로 세상을 느끼는 문학 소년/소녀 스타일 🎨',
    image: 'assets/images/type/type_emotional.png',
    color: Color(0xFFEF9A9A),
  ),
  TypeModel(
    name: '이성형',
    description: '감정보다 논리가 우선! 데이터가 말해주는 스타일 🔢',
    image: 'assets/images/type/type_logical.png',
    color: Color(0xFF42A5F5),
  ),
  TypeModel(
    name: '모험형',
    description: '한 번 사는 인생, 고삐 풀린 탐험가 스타일 🌍',
    image: 'assets/images/type/type_adventurous.png',
    color: Color(0xFFFF7043),
  ),
  TypeModel(
    name: '회피형',
    description: '갈등은 피하고 싶어요... 조용한 평화주의자 🕊️',
    image: 'assets/images/type/type_avoidant.png',
    color: Color(0xFF90A4AE),
  ),
  TypeModel(
    name: '자기중심형',
    description: '세상의 중심은 나! 본투비 메인캐 👑',
    image: 'assets/images/type/type_selfcentered.png',
    color: Color(0xFFD4AF37),
  ),
  TypeModel(
    name: '공감형',
    description: '“그럴 수 있지…” 친구 얘기만 들어도 울컥 😢',
    image: 'assets/images/type/type_empathic.png',
    color: Color(0xFF81C784),
  ),
  TypeModel(
    name: '돌직구형',
    description: '오승환 전성기급 돌직구! 돌려 말할 줄 모름 💥',
    image: 'assets/images/type/type_blunt.png',
    color: Color(0xFFEF5350),
  ),
  TypeModel(
    name: '이상주의형',
    description: '이상은 높고 현실은 시궁창… 그래도 꿈은 지켜 ✨',
    image: 'assets/images/type/type_idealist.png',
    color: Color(0xFFBA68C8),
  ),
  TypeModel(
    name: '현실주의형',
    description: '팩트와 실리를 우선! 현실 감각 충만한 타입 💼',
    image: 'assets/images/type/type_realist.png',
    color: Color(0xFF8D6E63),
  ),
  TypeModel(
    name: '낭만형',
    description: '하늘에 별 따러 가는 중… 낭만으로 사는 사람 🌙',
    image: 'assets/images/type/type_romantic.png',
    color: Color(0xFF7986CB),
  ),
  TypeModel(
    name: '도전형',
    description: '안 해본 거면 해봐야지! 도전은 나의 에너지 💪',
    image: 'assets/images/type/type_challenger.png',
    color: Color(0xFFFFA726),
  ),
  TypeModel(
    name: '관찰자형',
    description: '나는 말없이 지켜본다… 분석력 갑 👁️',
    image: 'assets/images/type/type_observer.png',
    color: Color(0xFF4DD0E1),
  ),
  TypeModel(
    name: '쾌락추구형',
    description: '맛집, 여행, 쇼핑까지! 오늘도 행복해야 해 😋',
    image: 'assets/images/type/type_pleasureseeker.png',
    color: Color(0xFFFFB6B9),
  ),
  TypeModel(
    name: '신중형',
    description: '충동? 그게 뭐죠? 한 발짝 전 고민 필수 🤔',
    image: 'assets/images/type/type_cautious.png',
    color: Color(0xFFB0BEC5),
  ),
  TypeModel(
    name: '충동형',
    description: '지금 아니면 언제 해! 충동구매 마스터 🛍️',
    image: 'assets/images/type/type_impulsive.png',
    color: Color(0xFFFDD835),
  ),
  TypeModel(
    name: '자기희생형',
    description: '나보다 남이 먼저… 헌신이 일상인 사람 💗',
    image: 'assets/images/type/type_selfless.png',
    color: Color(0xFFF48FB1),
  ),
  TypeModel(
    name: '호기심형',
    description: '어? 이건 뭐지? 궁금한 건 못 참아 🔍',
    image: 'assets/images/type/type_curious.png',
    color: Color(0xFF4FC3F7),
  ),
  TypeModel(
    name: '분석형',
    description: '모든 건 근거 있어야지. 디테일 장인 🧠',
    image: 'assets/images/type/type_analyst.png',
    color: Color(0xFF9575CD),
  ),
  TypeModel(
    name: '기피형',
    description: '선택은 남이 해줘… 결정장애 대표주자 😵‍💫',
    image: 'assets/images/type/type_indecisive.png',
    color: Color(0xFFE0E0E0),
  ),
  TypeModel(
    name: '전통중시형',
    description: '예의, 격식, 원칙은 필수. 어르신픽 스타일 👘',
    image: 'assets/images/type/type_traditionalist.png',
    color: Color(0xFFA1887F),
  ),
];
