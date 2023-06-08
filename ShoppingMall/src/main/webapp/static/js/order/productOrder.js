/**
 * productOrder.js
 * 배송지 정보 처리(주문자 정보와 같게, 새로 입력)
 * productOrder.jsp에 포함
 */


document.addEventListener('DOMContentLoaded', function () {
    
    const inputName = document.querySelector('input#name2').value;
    const inputPostCode = document.querySelector('input#postCode2').value;
    const inputAddr = document.querySelector('input#addr2').value;
    const inputDetailAddr = document.querySelector('input#detailAddr2').value;
    const inputPhone = document.querySelector('input#phone2').value;
    
    const sameOrderer = document.querySelector('input#flexRadioDefault1'); // 주문자 정보와 동일 라디오 버튼의 요소를 가져옴.
    const newInput = document.querySelector('input#flexRadioDefault2'); // 새로 입력 라디오 버튼의 요소를 가져옴.
    
    sameOrderer.addEventListener('click', () => {
        
        document.getElementById("name2").value = inputName; // 인풋의 값을 주문자 정보와 같게 입력
        document.getElementById("postCode2").value = inputPostCode;
        document.getElementById("addr2").value = inputAddr;
        document.getElementById("detailAddr2").value = inputDetailAddr;
        document.getElementById("phone2").value = inputPhone;
        
        document.getElementById("searchCode").disabled = true;  // 우편번호 찾기 비활성화
        document.getElementById("name2").readOnly = true;   // readonly 활성화
        document.getElementById("postCode2").readOnly = true;
        document.getElementById("addr2").readOnly = true;
        document.getElementById("detailAddr2").readOnly = true;
        document.getElementById("phone2").readOnly = true;
    });
    
    newInput.addEventListener('click', () => {
       
        document.getElementById("name2").value = ""; // 인풋의 값을 빈문자열로 초기화
        document.getElementById("postCode2").value = "";
        document.getElementById("addr2").value = "";
        document.getElementById("detailAddr2").value = "";
        document.getElementById("phone2").value = "";
        
        console.log('readOnly false');
        
        document.getElementById("searchCode").disabled = false; // 우편번호 찾기 활성화
        document.getElementById("name2").readOnly = false;  // readonly 비활성화, input에 입력 가능
        document.getElementById("detailAddr2").readOnly = false;
        document.getElementById("phone2").readOnly = false;
    });
    
});
