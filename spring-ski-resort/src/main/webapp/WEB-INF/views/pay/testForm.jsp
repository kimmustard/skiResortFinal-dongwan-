<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
        	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
            <meta charset="UTF-8">
            <title>Insert title here</title>
        </head>

        <body>

            <form action="/pay/order" method="post">
                <button type="submit" id="btn-kakao-pay"> 결제하기 </button>

            </form>
			

            <button id="inicis_pay" value="html5_inicis"> 이니시스 통합결제 </button>
            
            <button id="kakao_pay" value="kakaopay.TC0ONETIME"> 카카오결제 </button>
            
            <button id="toss_pay" value="tosspay.tosstest"> 토스페이 </button>
            
            <button id="payco_pay" value="payco.AUTOPAY"> 페이코 </button>
            
            <button id="naver_pay" value=""> 네이버페이(공사중) </button>

			<a href="/"><button> 메인으로 </button></a>
			<button id="coupon_get"> 쿠폰받기 </button>

            <script type="text/javascript" src="/resources/js/pay/pay.js"></script>
        </body>

        </html>