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
        <button type="button" class="btn btn-success mt-5" onclick="start();">Start</button>
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
    	// 성향 조사 문항
        var num = 1;
        var q = {
            1: {"title": "문제 1번", "type": "EI", "A": "바깥에 나가 활동적인 일을 하는것이 좋다", "B": "바깥에 나가는것 보다 집에서 노는 것이 더 기분이 좋다"},
            2: {"title": "문제 2번", "type": "EI", "A": "여러 사람들과 함께 있을때 에너지를 얻는다.", "B": "사교모임에 참석하는것 보다는 집에서 책이나 핸드폰을 하는게 더 즐겁다"},
            3: {"title": "문제 3번", "type": "EI", "A": "대화를 주도하는 편이다", "B": "대화를 주도하기보다는 상대방의 말을 듣고있는 편이다"},
            4: {"title": "문제 4번", "type": "SN", "A": "나는 주로 눈에 보이는것을 믿고 현실적인것을 생각한다", "B": "나는 상상력이 풍부해서 항상 머리가 복잡하다고 느낀다"},
            5: {"title": "문제 5번", "type": "SN", "A": "나는 영화를 볼때 영화 자체에 몰입하여 빠져든다", "B": "나는 영화를 볼 때 내가 주인공이 되는 상상을 한다"},
            6: {"title": "문제 6번", "type": "SN", "A": "갈등이 생겼을 때 바로 상대방과 대화를 통해 풀어나간다", "B": "갈등이 생겼을 때 혼자만의 시간이 필요하다"},
            7: {"title": "문제 7번", "type": "TF", "A": "나는 열심히 하지만 성과가 없는것 보다 결과물이 더 중요하다", "B": "나는 열심히 하지만 성과가 없는 팀원을 이름을 빼기 힘들다"},
            8: {"title": "문제 8번", "type": "TF", "A": "친구가 고민을 털어놨을 때 원인과 결과에 초점을 맞춰 조언해준다", "B": "친구가 고민을 털어놨을 때 힘들었을 친구의 마음을 다독여준다"},
            9: {"title": "문제 9번", "type": "TF", "A": "나에게 피해를 입혔을 때 바로 지적한다", "B": "나에게 피해가 있더라도 일단 참고본다"},
            10: {"title": "문제 10번", "type": "JP", "A": "여행은 발길이 닿는대로 의식의 흐름에 맡긴다", "B": "나는 여행계획을 꼼꼼하게 세운다"},
            11: {"title": "문제 11번", "type": "JP", "A": "무언가 하고싶을 때 일단 시작하고 본다", "B": "무엇을 하던 준비기간이 길다"},
            12: {"title": "문제 12번", "type": "JP", "A": "내가 놓는곳이 바로 그 물건의 자리이다", "B": "내 방의 물건은 항상 제자리에 있다"}        
        }
        // 결과 문항
        var result = {
            "ISTJ": {"animal": "진돗개", "explain": "규칙적이며 착실한 타입의 당신. 주어진 일은 끝까지 완수하고 단체생활에 매우 잘 적응하는 편이에요 <br> 용맹하고 충성심이 강한 진돗개와 많이 닮았어요!", "img": "resources/image/8.a1e186d576f2b.jpg"},
            "ISFJ": {"animal": "슈나우저", "explain": "매우솔직하고 빈말을 잘 못하는 착실한 타입의 당신, <br> 총명하고 외향적인 강아지인 슈나우저와 닮았어요!!", "img": "resources/image/3.su.jpg"},
            "INFJ": {"animal": "요크셔테리어", "explain": "계획적이고 인내심 많은 당신, 영감이 뛰어나고 깊은 통찰력이 있군요!! <br> 자립심이 강한 요크셔테리어와 닮았어요!!", "img": "resources/image/4.5fe48161dfcf410ea1f5730b4f292413.jpg" },
            "INTJ": {"animal": "푸들", "explain": "생각이 많고 복잡한 당신, 가끔 진지한 생각으로 상당한 시간을 보내는군요! <br>하고싶은일은 끝내주게 잘하는 푸들과 닮았어요! ", "img": "resources/image/pudel.jpg"},
            "ISTP": {"animal": "파피용", "explain": "만능재주꾼인 당신, 틀에 박힌 생활을 싫어하고 일을 효율적으로 잘하는 타입이에요<br> 똑똑한 매력의 사랑스러운 성격을 가진 에너제틱한 파피용과 잘 어울려요~ !!", "img": "resources/image/papi.jpg"},
            "ISFP": {"animal": "치와와", "explain": "포용력과 이해력이 많고, 현재의 삶을 즐기는 당신,<br> 경계심이 많지만 알고보면 헌신적인 치와와랑 매우 닮았답니다!!", "img":"resources/image/chiwa.jpg" },
            "INFP": {"animal": "포메라니안", "explain": "세심하고 삶에대한 고찰이 깊은 당신은<br>외로움을 많이타 질투심이 많은것이 포메라니안과 닮았어요 ", "img": "resources/image/3.four.jpg"},
            "INTP": {"animal": "닥스훈트", "explain": "지적인 매력이 넘치는 당신은<br>천재성이 돋보이는 닥스훈트와 닮았어요 한번 몰입하면 빠져나오기 힘들답니다!", "img": "resources/image/dacs.jpg"},
            "ESTP": {"animal": "코카스파니엘", "explain": "새로움에 대한 도전 욕구가 강하고 개방적인 당신은<br>사람을 좋아하고 활동적인 코카스파니엘과 매우 닮았어요! ", "img": "resources/image/4.83112e0057eb404682311029979f036f.jpg"},
            "ESFP": {"animal": "비글", "explain": "인기폭발 모두의 연예인인 당신은 신나고 재미있는 성격이네요 <br> 사람을 좋아하고 활동적인 비글과 정말 찰.떡.궁.합!! ", "img": "resources/image/6.bigle.jpg"},
            "ENFP": {"animal": "스피츠", "explain": "감정이 풍부하고 정이많은 당신, 하기싫은 일은 끝까지 안하는 고집이 있어요<br> 영리하지만 때로는 고집이 센 스피츠와 닮았네요!!", "img": "resources/image/2.spit.jpg"},
            "ENTP": {"animal": "말티즈", "explain": "무엇을 하던 평균이상 팔방미인, 두뇌 회전이 빠른 편이고 직관적이네요!<br>애정이많고 눈치가빠른 말티즈와 닮았어요 !", "img":"resources/image/4.e9bccd294d5b4632a8eb7e7906bcd05a.jpg" },
            "ESTJ": {"animal": "불독", "explain": "모든일을 계획하고 도전정신이 강한 야심가인 당신 <br>우호적이고 사교적인 반면 자기 고집이 세기도 한 불독과 닮았어요!", "img": "resources/image/6.fire.jpg"},
            "ESFJ": {"animal": "레브라도 리트리버", "explain": "준비성과 참을성이 많고 솔직한 당신은 사교성이 좋아 사람들과 잘 어울려요<br> 총명하고 믿음직스러운 레브라도 리트리버와 찰떡궁합!!", "img": "resources/image/5.ritri.jpg"},
            "ENFJ": {"animal": "셔틀랜드 쉽독", "explain": "사람을 좋아하고 마음이 약한 당신은 제 사람이라면 한없이 베풀어 상처를 받기도 하네요!<br>온화하고 다정한 성격을가진 셔틀랜드 쉽독과 잘 어울려요 ", "img": "resources/image/selti.png"},
            "ENTJ": {"animal": "웰시코기", "explain": "솔직,결단,통솔력을 두루 갖춘 이시대의 리더인 당신은 호기심과 지적 욕구가 많아 보여요<br> 외향적이고 호기심 많은 성격인 웰시코기와 좋은 친구가 될 것 같아요! ", "img":"resources/image/5.koki.jpg" },        
      
        }
        // 성향 조사 시작
        function start() {
            $(".start").hide();
            $(".question").show();
            next();
        }
        // A 항목의 버튼을 클릭하면 +1
        $("#A").click(function() {
            var type = $("#type").val();
            var preValue = $("#"+type).val();
            $("#"+type).val(parseInt(preValue)+1);
            next();
        });
        // B 항목을 클릭하면 바로 다음으로
        $("#B").click(function() {
            next();
        });
        // 질문 항목이 항목 만큼만 
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
            	// 질문을 하나씩 클릭할 때마다 프로그레스 바가 1씩 증가
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