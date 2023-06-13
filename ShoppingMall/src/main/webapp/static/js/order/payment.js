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
    $(document).ready(function() {
    // 결제완료 버튼 클릭 시 이벤트 핸들러 등록
    $("#paymentButton").click(function() {

        console.log(oDiscountPrice);
        console.log(oFinalPrice);
        console.log(oPoint);
        console.log(oStatus);
        submitOrder();
        submitDelivery(); 
  });
});
    
    function submitOrder() {
      /*var uId = uId;*/  
      /*var oInitialPrice = productPrice;  */
      var oDiscountPrice = $("#currentPoint").val();
      var oFinalPrice = productShipPrice - $("#currentPoint").val();
      var oPoint = $("#mAllMileageSum").val();
      var oStatus = "결제완료";
      
      $.ajax({
        url: "/joo/api/order/order", // 컨트롤러의 URL을 적절히 수정해야 합니다.
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          u_id: uId,
          oinitial_price: productPrice,
          odiscount_price: oDiscountPrice,
          ofinal_price: oFinalPrice,
          opoint: oPoint,
          oStatus: oStatus
          
        }),
        success: function() {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          console.log("Order data inserted successfully.");
          
        },
        error: function(error) {
          // 데이터 전송 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error inserting order data:", error);
        }
      });
    }
    
    function submitDelivery() {
      var oId = 1; // 이 부분은 JSP 코드에서 얻어올 값으로 대체
      var dCode = "1234567890"; // 이 부분은 JSP 코드에서 얻어올 값으로 대체
      var dStreet = $("#addr2").val();
      var dDetailAddress = $("#detailAddr2").val();
      var dPostcode = $("#postCode2").val();
      var rName = $("#name2").val();
      var rPhone = $("#phone2").val();
      var dMessage = $("#message").val();
      var dStatus = "결제완료"; // 이 부분은 JSP 코드에서 얻어올 값으로 대체
      var dType = 1; // 이 부분은 JSP 코드에서 얻어올 값으로 대체
      
      $.ajax({
        url: "/joo/api/order/delivery", // 컨트롤러의 URL을 적절히 수정해야 합니다.
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

