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
        <button type="button" class="btn btn-success mt-5" onclick="start();">강아지</button>
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
        <img id="img" class="rounded-circle mt-5" src="resources/image/dog-4633734_640.jpg" alt="animal">
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
            1: {"title": "문제 1번", "type": "EI", "A": "영국에 가보신적이 있으신가요?", "B": "보석을 좋아하시나요?"},
            2: {"title": "문제 2번", "type": "EI", "A": "아이가 있으신가요?", "B": "중국에 가보신적이 있으신가요?"},
            3: {"title": "문제 3번", "type": "EI", "A": "뛰어노는 것을 좋아하시나요?", "B": "보호받는것을 원하시나요?"},
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
            "ISTJ": {"animal": "진돗개", "explain": "누군가의 위에 있고 싶어는 당신에게 너무 알맞는 강아지 입니다. \n 충성심이 매우 강한 강아지 입니다!!", "img": "resources/image/8.a1e186d576f2b.jpg"},
            "ISFJ": {"animal": "푸들", "explain": "활동적인 당신의 친구가 되어줄 수 있습니다~ \n 훈련성으로는 강아지들중 TOP3안에 들어갑니다!!", "img": "resources/image/pudel.jpg"},
            "INFJ": {"animal": "비글", "explain": "장난끼가 많은 당신에게 알맞는 강아지가 아닐까 싶습니다!! \n 머리가 매우 나쁘지만 소형 동물을 잘 사냥합니다!!", "img": "resources/image/6.bigle.jpg"},
            "INTJ": {"animal": "시추", "explain": "중국을 좋아하는 당신에게 딱일거 같아요^^ \n 독특한 성격과 특성을 좋아한다면 안성맞춤!!", "img": "resources/image/5.5.jpg"},
            "ISTP": {"animal": "말티즈", "explain": "아주 작고 너~~무 귀여워요!! \n 귀여움을 좋아하는 당신에게 잘 어울릴거 같아요!!", "img": "resources/image/4.e9bccd294d5b4632a8eb7e7906bcd05a.jpg"},
            "ISFP": {"animal": "요크셔 테리어", "explain": "보석을 좋아한다면 요크셔가 어떨까요?! \n 북부 잉글랜드에서는 움직이는 보석견으로 불린다고 합니다!!", "img": "resources/image/4.5fe48161dfcf410ea1f5730b4f292413.jpg"},
            "INFP": {"animal": "슈나우저", "explain": "고급스러움을 느끼고 싶다면 슈나우저가 어떨까요?! \n 뚱하고 심드렁한 표정이 아주 매력적입니다!!", "img": "resources/image/3.su.jpg"},
            "INTP": {"animal": "코카스파니엘", "explain": "집순이 집돌이 분들에게 안성맞춤!!! \n 지구력이 떨어져서 조금만 놀아줘도 금방 지쳐서 잠들어요~~", "img": "resources/image/4.83112e0057eb404682311029979f036f.jpg"},
            "ESTP": {"animal": "시고르자브종", "explain": "시골에 사신다면 역시 시고르자브종이죠!! \n 시고르자브종의 위엄을 느껴보쉴?", "img": "resources/image/6.h0of6r3f5a6nm3ogv40x.jpg"},
            "ESFP": {"animal": "프렌치 불톡", "explain": "혹시 혼자사시나요~~? 그렇다면 프렌치 불독이 어떨까요?! ", "img": "resources/image/4.83112e0057eb404682311029979f036f.jpg"},
            "ENFP": {"animal": "스피츠", "explain": "고집이 있으시다면 스피츠를 추천해 드립니다!! \n 전혀 심심치 않을거에요!!", "img": "resources/image/2.spit.jpg"},
            "ENTP": {"animal": "포메라니안", "explain": "영국 왕족이 키웠다고 하는 포메를 키우면서 \n 여왕의 기분을 느껴보시는건 어떠신가요?!", "img": "resources/image/3.four.jpg"},
            "ESTJ": {"animal": "웰시 코기", "explain": "귀여운 방댕이를 보유하고 있어요~~ \n 산책할 때 다른곳에 눈돌릴 틈이 없습니다!!", "img": "resources/image/5.koki.jpg"},
            "ESFJ": {"animal": "페키니즈", "explain": "귀족의 기분을 느껴보고 싶으신가요?! \n 무심하고 품위가 있는 페키니즈가 어울립니다!!", "img": "resources/image/4.peki.jpg"},
            "ENFJ": {"animal": "저먼 셰퍼드", "explain": "아이가 있으시다면 딱 좋은거 같아요!! \n 머리도 좋고 충성심도 있어서 든든한 보디가드가 돼어줄거에요!!", "img": "resources/image/4.shea.jpg"},
            "ENTJ": {"animal": "라브라도 리트리버", "explain": "좋은 친구가 필요하신가요?! \n 정말 좋은 친구가 되어 줄겁니다!!", "img": "resources/image/5.ritri.jpg"},
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