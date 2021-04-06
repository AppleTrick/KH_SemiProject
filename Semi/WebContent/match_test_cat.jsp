<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body class="container">
	<%@ include file="Form/header.jsp"%>
    <article class="start">
        <h1 class="mt-5 text-center">나랑 꼭 닮은 동물</h1>
        <button type="button" class="btn btn-success mt-5" onclick="start();">고양이</button>
    </article>
    <article class="question">
        <div class="progress mt-5">
            <div class="progress-bar" role="progressbar" style="width: calc(100/12*1%)"></div>
        </div>
        <h2 id="title" class="text-center mt-5">문제</h2>
        <input id="type" type="hidden" value="EI">
        <button id="A" type="button" class="btn btn-secondary mt-5">Secondary</button>
        <button id="B" type="button" class="btn btn-secondary mt-5">Secondary</button>
    </article>
    <article class="result">
        <img id="img" class="rounded-circle mt-5" src="resources/image/10.an.jpg" alt="animal">
        <h2 id="animal" class="text-center mt-5">동물품종</h2>
        <h3 id="explain" class="text-center mt-5">설명</h3>
    </article>
    <input type="hidden" id="EI" value="0">
    <input type="hidden" id="SN" value="0">
    <input type="hidden" id="TF" value="0">
    <input type="hidden" id="JP" value="0">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script>
        var num = 1;
        var q = {
            1: {"title": "문제 1번", "type": "EI", "A": "영국에 가보신적이 있으신가요?", "B": "국내를 좋아하시나요?"},
            2: {"title": "문제 2번", "type": "EI", "A": "아이가 있으신가요?", "B": "독특한것을 좋아하시나요?"},
            3: {"title": "문제 3번", "type": "EI", "A": "뛰어노는 것을 좋아하시나요?", "B": ""},
            4: {"title": "문제 4번", "type": "SN", "A": "혼자 있는것을 즐기나요?", "B": "국밥을 좋아하시나요?"},
            5: {"title": "문제 5번", "type": "SN", "A": "지휘하는것을 좋아하시나요?", "B": "해외 여행을 다니시나요?"},
            6: {"title": "문제 6번", "type": "SN", "A": "반려동물과 함께 많은것을 해보고 싶나요?", "B": "고집이 있으신가요?"},
            7: {"title": "문제 7번", "type": "TF", "A": "외로움을 많이 타시나요?", "B": "장난끼가 많으신가요?"},
            8: {"title": "문제 8번", "type": "TF", "A": "좋은 친구를 원하시나요?", "B": "귀여운 것을 좋아하시나요?"},
            9: {"title": "문제 9번", "type": "TF", "A": "독특한 것을 좋아하시나요?", "B": "작은것을 좋아하시나요?"},
            10: {"title": "문제 10번", "type": "JP", "A": "외출을 자주 하시나요?", "B": "집에만 있는것을 좋아하시나요?"},
            11: {"title": "문제 11번", "type": "JP", "A": "활동적인 취미를 즐기시나요?", "B": "비활동 적인 취미를 즐기시나요?"},
            12: {"title": "문제 12번", "type": "JP", "A": "보호가 필요하신가요?", "B": "고풍스러운것을 좋아하시나요?"}
        }
        var result = {
            "ISTJ": {"animal": "한국 고양이", "explain": "역시 한국인이라면 한국 고양이 아입니까?! 가즈아!!", "img": "resources/image/3.kcat.jpg"},
            "ISFJ": {"animal": "벵갈", "explain": "호랑이와 표범같은 특유의 와일드한 외모를 원하신다면 벵갈고양이가 안성맞춤!!", "img": "resources/image/2.bang.jpg"},
            "INFJ": {"animal": "브리티시 쇼트헤어", "explain": "평화로움과 인내심을 가지고 있는 고양이입니다!! 그렇다고 너무 괴롭히시면 안돼요!!", "img": "resources/image/5.bri.jpg"},
            "INTJ": {"animal": "믹스묘", "explain": "여러 품종의 특징을 원하신다면 당신에게 아주 잘 어울릴거 같습니다~~", "img": "resources/image/7.mix.jpg"},
            "ISTP": {"animal": "페르시안", "explain": "고양이를 키우고 싶지만 불독같은 외모를 원하신다면 딱이에요~!", "img": "resources/image/10.an.jpg"},
            "ISFP": {"animal": "아메리칸 숏헤어", "explain": "활동성이 아주 높은 고양이 입니다~! 진정한 집사역할을 원하신다면 추천드려요!!!", "img": "resources/image/3.ame.jpg"},
            "INFP": {"animal": "러시안 블루", "explain": "왕실 출신의 고양이 당신도 왕실의 느낌을 느껴보세요!!", "img": "resources/image/3.resh.jpg"},
            "INTP": {"animal": "터키시 앙고라", "explain": "활발하고 성질이 급하다면 좋은 커플이 될거 같습니다!! ", "img": "resources/image/10.tuci.jpg"},
            "ESTP": {"animal": "아비시니안", "explain": "강아지의 느낌을 가진 고양이를 키우고 싶으시다고요?! 그렇다면 여기있습니다~!", "img": "resources/image/9.abi.jpg"},
            "ESFP": {"animal": "스코티시폴드", "explain": "애교있는 고양이를 찾으신다면 여기 있습니다!! 단! 애교가 너~무 많아요!!", "img": "resources/image/6.sco.jpg"},
            "ENFP": {"animal": "샴", "explain": "간혹 톡톡튀기는 하지만 사람 손 타는걸 좋아합니다~~ 외롭지 않을거에요!!", "img": "resources/image/6.syam.jpg"},
            "ENTP": {"animal": "먼치킨", "lain": "웰시 코기와 같이 숏다리를 가진 고양이 입니다!! 너무너무 귀여워요!!", "img": "resources/image/2.men.jpg"},
            "ESTJ": {"animal": "노르웨이 숲", "explain": "큰 품종과 멋있는 고양이를 원하신다면 놀숲이 당신에게 안성맞춤!!", "img": "resources/image/6.nul.jpg"},
            "ESFJ": {"animal": "버만", "explain": "놀기를 좋아하지만 침착한 성격도 가지고 있지만 낮을 가리기 때문에 당신만 바라봐주길 바란다면 딱좋아!!", "img": "resources/image/7.be.jpg"},
            "ENFJ": {"animal": "메인쿤", "explain": "같이 수영하고 씻고 싶다면 메인쿤이 어떨까요?! 다른 고양이들과는 다르게 물을 좋아합니다~~!!", "img": "resources/image/7.cun.jpg"},
            "ENTJ": {"animal": "하이랜드 폴드", "explain": "사교성이 정말 좋습니다~ 또한 애교도 많기 때문에 카페에 같이 가면 인기를 독차지!!", "img": "resources/image/5.ha.jpg"},
        }

        function start() {
            $(".start").hide();
            $(".question").show();
            next();
        }

        $("#A").click(function() {
            var type = $("#type").val();
            var preValue = $("#"+type).val();
            $("#"+type).val(parseInt(preValue)+1);
            next();
        });
        $("#B").click(function() {
            next();
        });
        function next() { 
            if (num == 13) {
                $(".question").hide();
                $(".result").show();
                var mbti = "";
                ($("#EI").val() < 2) ? mbti += "I" : mbti += "E";
                ($("#SN").val() < 2) ? mbti += "N" : mbti += "S";
                ($("#TF").val() < 2) ? mbti += "F" : mbti += "T";
                ($("#JP").val() < 2) ? mbti += "J" : mbti += "P";
                $("#img").attr("src", result[mbti]["img"]);
                $("#animal").html(result[mbti]["animal"]);
                $("#explain").html(result[mbti]["explain"]);
                num++;
            } else {
                $(".progress-bar").attr('style', 'width: calc(100/12*'+num+'%)');
                $("#title").html(q[num]["title"]);
                $("#type").val(q[num]["type"]);
                $("#A").html(q[num]["A"]);
                $("#B").html(q[num]["B"]);
                num++;
            }
        }
    </script>
</body>
</html>