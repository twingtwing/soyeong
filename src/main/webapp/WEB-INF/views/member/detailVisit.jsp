<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #all {
            display: grid;
            grid-template-columns: 1fr 2fr;
            justify-content: center;
            align-items: center;
            width: 80vw;
            margin: 10rem;
            margin-top:0px;
        }

        .bookInfo {
            display: flex;
            flex-direction: column;
            margin: 1rem;
            align-items: center;
        }

        .bookDetails {
            display: flex;
            flex-direction: column;
            margin-top: 2.5rem;
        }

        .back {
            border: 0px solid white;
            border-radius: 5rem;
            padding: 0.5rem 1rem;
            position: inherit;
            margin-top: 5rem;
            margin-left : 5rem;
            z-index: 2;
            cursor:pointer;
        }

        .bookInfo>div>div {
            cursor: pointer;
            display: inline-block;
            padding: 0.5rem 1rem;
            margin: 7px;
        }

        .bookInfo button {
            width: 15rem;
            background-color: #04091e;
            border: 1px solid #04091e;
            padding: 5px;
            border-radius: 5px;
            color: white;
        }

        .bookImg {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-evenly;
        }
        .bookImg>div>span:nth-child(1){
            font-size:  1.1rem;
            font-weight: bold;
        }
        .state{
            display: flex;
            justify-content: space-between;
        }
        .bookDetails>span:nth-child(2n) {
            border-top: 1px solid gray;
            font-size: 1.05rem;
        }

        .bookDetails>span:nth-child(1),
        .bookDetails>span:nth-child(8),
        .bookDetails>span:nth-child(10) {
            font-size: 1.3rem;
            font-weight: bold;
            border-top: 1px solid gray;
        }

        .bookDetails>span {
            padding: 0.5rem 1rem;
        }

        .refundBar {
            background-color: gray;
            padding: 1rem;
            border: 1px solid gray;
            border-radius: 10px;
            width: 35vw;
        }
        .bookImg button{
            color: #04091e;
            background-color: lightgray;
            border: 1px solid lightgray;
            padding: 5px 1rem;
            border-radius: 3px;
            margin: 0.5rem;
            margin-top : 1.5rem;
        }
        .bookImg img{
        	
        }
    </style>
</head>

<body>
    <section class="breadcrumb_area">

        <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""
            style="transform: translateY(0px);"><img src="resources/img/banner_bg.jpg"></div>
        <div class="container">
            <div class="page-cover text-center">
                <h2 class="page-cover-tittle">예약 세부 정보(마이페이지에서 예약정보 하나 선택했을때)</h2>
            </div>
        </div>
    </section>



    <button type="button" onclick="location.href='home.do'" class="back">&lt; 뒤로가기</button>
    <div id="all">
        <div class="bookInfo">
            <div align="center">
                <div>체크인</div><span style="font-size:2rem;"> | </span>
                <div>체크아웃</div><br>
                <button>메시지 보내기</button>
            </div>
            <div class="bookDetails">
                <span>예약 세부정보</span>
                <span>게스트</span>
                <span>(대충 db값)</span>
                <span>예약번호</span>
                <span>(대충 db값)</span>
                <span>환불정책</span>
                <span>(대충 db값)</span>
                <span>찾아오시는 길</span>
                <span>(대충 db값)</span>
                <span>결제정보</span>
                <span>(대충 db값)</span>
            </div>
        </div>
        <div class="bookImg">
            (대충 방 사진)
            <div>
                <span>취소 진행사항</span><br>
                <div class="state">
                <span>요청</span><span>지급</span><span>처리</span>
                </div>
                <div class="refundBar"></div>
                <div align ="right">
                    <button>메시지</button><button>취소</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>