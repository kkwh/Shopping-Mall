/**
 * payment.js
 * orderPage.jsp에서 사용됨.
 */

/*$(document).ready(function() {
    $("#paymentButton").click(function(e) {
        e.preventDefault(); // 폼 기본 동작을 중지시킵니다.

        // AJAX 요청을 보냅니다.
        $.ajax({
        url: "/",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
        userId: "${user.uid}",
        initialPrice: "${product.pprice * product.pstock}",
        discountPrice: "${user.ucurrent_point >= 10000 ? user.ucurrent_point : 0}",
        finalPrice: "${product.pprice * product.pstock + 3000 - (user.ucurrent_point >= 10000 ? user.ucurrent_point : 0)}",
        point: $("#pointInput").val()
                    },
        success: function(response) {
            // AJAX 요청이 성공하면 처리할 코드를 작성합니다.
            console.log(response); // 응답 데이터를 출력합니다.
            // 여기서 필요한 추가 작업을 수행합니다.
        },
        error: function(xhr, status, error) {
            // AJAX 요청이 실패하면 처리할 코드를 작성합니다.
            console.error(error); // 에러 메시지를 출력합니다.
            // 여기서 필요한 추가 작업을 수행합니다.
        }
            });
        });
    });*/
    var orderId = 0;
    $(document).ready(function() {
    // 결제완료 버튼 클릭 시 이벤트 핸들러 등록
    $("#paymentButton").click(function() {
        
        submitOrder(); // 주문 정보 저장
        updateCurrentPointWhenBuy(); // 결제완료 시 현재 포인트 차감
        updateStockAndSold(); // 결제완료 시 재고 감소, 판매량 증가
        
  });
});
    
    function submitOrder() {
      // var uId = uId;
      // var oInitialPrice = productPrice;  
      var oDiscountPrice = $("#currentPoint").val();
      var oFinalPrice = productShipPrice - $("#currentPoint").val();
      // var oPoint = $("#mAllMileageSum").val();
      var oStatus = "결제완료"
      
      $.ajax({
        url: "/joo/api/order/order", // 컨트롤러의 URL을 적절히 수정해야 합니다.
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          u_id: uId,
          oinitial_price: productPrice,
          odiscount_price: oDiscountPrice,
          ofinal_price: oFinalPrice,
          opoint: point,
          ostatus: oStatus
          
        }),
        success: function(response) {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          orderId = response;
          
          console.log(response);
          console.log("Order data inserted successfully.");
          
          submitOrderProduct(); // 주문 상품 정보 저장
          submitDelivery(); // 배송 정보 저장
          
        },
        error: function(error) {
          // 데이터 전송 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error inserting order data:", error);
        }
      });
    }
    
    function submitOrderProduct() { 
      // var pId 
      var oId = orderId // order의 o_id 리턴 받은 값으로 초기화
      console.log('주문상품 oid 테스트' + oId);
      var pCount = 10 // 수량 입력받아서 초기화
      // var pPrice
      
      $.ajax({
        url: "/joo/api/order/orderProduct", // 컨트롤러의 URL을 적절히 수정해야 합니다.
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          p_id: pId,
          o_id: oId,
          pcount: pCount,
          pprice: price
          
        }),
        success: function() {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          console.log("OrderProduct data inserted successfully.");
          
        },
        error: function(error) {
          // 데이터 전송 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error inserting OrderProduct data:", error);
        }
      });
    }
    
    function submitDelivery() {
      var oId = orderId; 
      console.log('배송 oid 테스트' + oId);
      var dCode = "1234567890"; // 10자리 송장으로 변경
      var dStreet = $("#addr2").val();
      var dDetailAddress = $("#detailAddr2").val();
      var dPostcode = $("#postCode2").val();
      var rName = $("#name2").val();
      var rPhone = $("#phone2").val();
      var dMessage = $("#message").val();
      var dStatus = "결제완료"; 
      var dType = 1; 
      
      $.ajax({
        url: "/joo/api/order/delivery", // 컨트롤러의 URL을 적절히 수정
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          o_id: oId,
          dcode: dCode,
          dstreet: dStreet,
          ddetail_address: dDetailAddress,
          dpostcode: dPostcode,
          rname: rName,
          rphone: rPhone,
          dmessage: dMessage,
          dstatus: dStatus,
          dtype: dType
        }),
        success: function() {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          console.log("Delivery data inserted successfully.");
          
        },
        error: function(error) {
          // 데이터 전송 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error inserting delivery data:", error);
        }
      });
    }
    
    function updateCurrentPointWhenBuy() {
      var oDiscountPrice = $("#currentPoint").val();
      console.log("차감될 포인트 금액 : " + oDiscountPrice);
      console.log("유저 아이디 : " + uId);  
        
      $.ajax({
        url: "/joo/api/order/currentPointWhenBuy", 
        method: "POST", // PUT 대신 POST 사용
        contentType: "application/json",
        data: JSON.stringify({
          odiscount_price: oDiscountPrice,
          u_id: uId
     
        }),
        success: function(response) {
          // 업데이트가 성공적으로 처리된 후에 실행할 동작을 여기에 작성
          console.log("결제완료 -> 현재 포인트가 차감되었습니다.", response);
        },
        error: function(error) {
          // 업데이트 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error updating currentPointWhenBuy:", error);
        }
      });
    }
    
    function updateStockAndSold() {
      var pCount = 10 // 수량 입력받아서 초기화  
        
      $.ajax({
        url: "/joo/api/order/stockAndSoldWhenBuy", // 
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          p_id: pId,
          pcount: pCount
        }),
        success: function(response) {
          // 업데이트가 성공적으로 처리된 후에 실행할 동작을 여기에 작성
          console.log("Stock and sold updated successfully:", response);
        },
        error: function(error) {
          // 업데이트 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error updating stock and sold:", error);
        }
      });
    }




