/**
 * myOrder.js
 * 주문 내역 조회 / 취소 내역 조회
 * myOrder.jsp에 포함.
 */

document.addEventListener('DOMContentLoaded', () => {

    // 주문 내역 조회 / 취소 내역 조회 버튼을 찾음.
    const btnOrder = document.querySelector('button#btnOrder');
    const btnCancel = document.querySelector('button#btnCancel');

    // 주문 내역 조회 버튼 클릭 시
    btnOrder.addEventListener('click', () => {

        console.log('주문 내역 조회 버튼 클릭')

        resetFilters();
        showAllRows();
        document.getElementById("order-table").style.display = "table";
        document.getElementById("cancel-table").style.display = "none";
    })

    // 취소 내역 조회 버튼 클릭 시
    btnCancel.addEventListener('click', () => {

        console.log('취소 내역 조회 버튼 클릭')

        resetFilters();
        showAllRows();
        document.getElementById("order-table").style.display = "none";
        document.getElementById("cancel-table").style.display = "table";
    })

    // 조회하기 버튼 클릭 시 이벤트 핸들러
    document.querySelector('.order-filter-confirm').addEventListener('click', function() {
        // 선택한 기간에 해당하는 주문일자 필터링
        var startDate = document.querySelector('input[name="dt_fr_input"]').value;
        var endDate = document.querySelector('input[name="dt_to_input"]').value;
        var orders = document.querySelectorAll('#order-table tbody tr');
        var cancels = document.querySelectorAll('#cancel-table tbody tr');

        orders.forEach(function(order) {
            var orderDate = order.querySelector('td:nth-child(4)').textContent;
            order.style.display = isOrderDateInRange(orderDate, startDate, endDate) ? 'table-row' : 'none';
        });

        cancels.forEach(function(cancel) {
            var cancelDate = cancel.querySelector('td:nth-child(4)').textContent;
            cancel.style.display = isCancelDateInRange(cancelDate, startDate, endDate) ? 'table-row' : 'none';
        });

    });

    // 주문일자가 선택한 기간 내에 있는지 확인하는 함수
    function isOrderDateInRange(orderDate, startDate, endDate) {
        var orderTimestamp = new Date(orderDate).getTime();
        var startTimestamp = new Date(startDate).getTime();
        var endTimestamp = new Date(endDate).getTime();

        return orderTimestamp >= startTimestamp && orderTimestamp <= endTimestamp;
    }

    // 취소일자가 선택한 기간 내에 있는지 확인하는 함수
    function isCancelDateInRange(cancelDate, startDate, endDate) {
        var cancelTimestamp = new Date(cancelDate).getTime();
        var startTimestamp = new Date(startDate).getTime();
        var endTimestamp = new Date(endDate).getTime();

        return cancelTimestamp >= startTimestamp && cancelTimestamp <= endTimestamp;
    }

    // ----------- 조회하기 / 기간 구분 -----------------------

    // 기간 버튼 클릭 시 이벤트 핸들러
    document.querySelectorAll('.order-filter-period__tab__button').forEach(function(button) {
        button.addEventListener('click', function() {
            var period = this.textContent;
            var startDate = calculateStartDate(period);
            var endDate = getCurrentDate();
            filterOrdersByDate(startDate, endDate);
            filterCancelsByDate(startDate, endDate);
        });
    });


    // 선택한 기간에 해당하는 주문일자 필터링 함수
    function filterOrdersByDate(startDate, endDate) {
        var orders = document.querySelectorAll('#order-table tbody tr');

        orders.forEach(function(order) {
            var orderDate = order.querySelector('td:nth-child(4)').textContent;
            order.style.display = isOrderDateInRange(orderDate, startDate, endDate) ? 'table-row' : 'none';
        });
    }

    // 선택한 기간에 해당하는 취소일자 필터링 함수
    function filterCancelsByDate(startDate, endDate) {
        var cancels = document.querySelectorAll('#cancel-table tbody tr');

        cancels.forEach(function(cancel) {
            var cancelDate = cancel.querySelector('td:nth-child(4)').textContent;
            cancel.style.display = isOrderDateInRange(cancelDate, startDate, endDate) ? 'table-row' : 'none';
        });
    }

    // 오늘 날짜를 YYYY-MM-DD 형식으로 반환하는 함수
    function getCurrentDate() {
        var today = new Date();
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, '0');
        var day = String(today.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    // 선택한 기간에 해당하는 시작 날짜를 계산하는 함수
    function calculateStartDate(period) {
        var startDate = new Date();

        if (period === '1주일') {
            startDate.setDate(startDate.getDate() - 7);
        } else if (period === '1개월') {
            startDate.setMonth(startDate.getMonth() - 1);
        } else if (period === '3개월') {
            startDate.setMonth(startDate.getMonth() - 3);
        } else if (period === '6개월') {
            startDate.setMonth(startDate.getMonth() - 6);
        }

        var year = startDate.getFullYear();
        var month = String(startDate.getMonth() + 1).padStart(2, '0');
        var day = String(startDate.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    // -------------- 주문 내역 조회 / 취소 내역 조회 버튼을 클릭했을 때 필터링된 테이블의 값이 원래 값으로 초기화 되도록

    // 필터 초기화 함수
    function resetFilters() {
        
        console.log('필터 초기화')
        const fromDateInput = document.querySelector('input[name="dt_fr_input"]');
        const toDateInput = document.querySelector('input[name="dt_to_input"]');
        fromDateInput.value = '';
        toDateInput.value = '';
    }

    // 모든 행 보이기 함수
    function showAllRows() {
        
        console.log('모든 행 보이기')
        const orderTable = document.getElementById('order-table');
        const cancelTable = document.getElementById('cancel-table');

        const orderRows = orderTable.querySelectorAll('tbody tr');
        orderRows.forEach(row => {
            row.style.display = ''; // 행을 보이도록 표시
        });

        const cancelRows = cancelTable.querySelectorAll('tbody tr');
        cancelRows.forEach(row => {
            row.style.display = ''; // 행을 보이도록 표시
        });
    }

    // -------------- 주문 취소 모달 구현

    // 주문 취소 버튼 클릭 시 모달 창 열기
    const cancelOrderButtons = document.querySelectorAll('[data-orderid]');
    const cancelOrderModal = document.getElementById('cancelOrderModal');
    const confirmCancel = document.getElementById('confirmCancel');
    const closeModal = document.getElementsByClassName('close')[0];

    // 모든 주문 취소 버튼에 대해 이벤트 리스너를 등록.
    for (let i = 0; i < cancelOrderButtons.length; i++) {
    cancelOrderButtons[i].addEventListener('click', function() {
        cancelOrderModal.style.display = 'block';
    });
}
    // 모달 창 닫기
    closeModal.addEventListener('click', function() {
        cancelOrderModal.style.display = 'none';
    });

    // 주문 취소 확인 버튼 클릭 시 실제 주문 취소 동작 수행
    confirmCancel.addEventListener('click', function() {
        // 주문 취소 로직 작성
        // AJAX 요청을 사용하여 서버로 주문 취소 요청을 보냄.
        console.log('주문 취소');
        /*        
                if(!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }*/
        // 삭제할 아이디:
        // const id = e.target.getAttribute('data-id');
        const id = this.getAttribute('data-orderid');
        console.log(id);
        // 삭제 요청 URL
        const reqUrl = `/joo/api/order/cancel/${id}`;
        // 삭제 요청을 Ajax 방식으로 보냄.
        axios.put(reqUrl)
            .then((response) => {
                console.log(response);
                alert('주문 취소가 완료되었습니다.');
                console.log(id + "주문취소 완료");
                location.reload(); // 현재 페이지를 새로고침하여 화면을 갱신
            })
            .catch((error) => {
                console.log('주문취소 에러');
                console.log(error);
            });

        // 주문 취소 후 모달 닫기
        cancelOrderModal.style.display = 'none';
    });
    
     // -------------- 구매 확정 모달 구현

    // 구매 확정 버튼 클릭 시 모달 창 열기
    const confirmOrderButtons = document.querySelectorAll('[data-confirmid]'); // 구매확정 버튼
    const confirmOrderModal = document.getElementById('confirmOrderModal');
    const confirmOrder = document.getElementById('confirmOrder'); // 구매확정 뒤 '예' 버튼
    const closeOrderModal = document.getElementsByClassName('closeOrder')[0];

    for (let i = 0; i < confirmOrderButtons.length; i++) {
    confirmOrderButtons[i].addEventListener('click', function() {
        confirmOrderModal.style.display = 'block';
        });
    }
    
    // 모달 창 닫기
    closeOrderModal.addEventListener('click', function() {
        confirmOrderModal.style.display = 'none';
    });

    // 구매 확정 버튼 클릭 시 실제 구매 확정 동작 수행
    confirmOrder.addEventListener('click', function() {
        // 구매확정 로직 작성
        // AJAX 요청.
        console.log('구매 확정');
        /*        
                if(!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }*/
        // 삭제할 아이디:
        // const id = e.target.getAttribute('data-id');
        const id = confirmOrder.getAttribute('data-confirmid');
        console.log(id);
        // 삭제 요청 URL
        const reqUrl = `/joo/api/order/buy/${id}`;
        // 삭제 요청을 Ajax 방식으로 보냄.
        axios.put(reqUrl)
            .then((response) => {
                console.log(response);
                alert('구매확정이 완료되었습니다.');
                console.log(id + "구매확정 완료");
                location.reload(); // 현재 페이지를 새로고침하여 화면을 갱신
            })
            .catch((error) => {
                console.log('구매확정 에러');
                console.log(error);
            });
    
    // 구매 확정 후 모달 닫기
    confirmOrderModal.style.display = 'none';
    });

})

// 배송조회 새 창 설정하는 함수
function openWindowWithPosition(event) {
  event.preventDefault(); // 기본 동작인 링크 이동을 방지

  var width = 550; // 창의 너비
  var height = 400; // 창의 높이
  var left = (window.innerWidth - width) / 2; // 화면 가로 중앙에 위치
  var top = (window.innerHeight - height) / 2; // 화면 세로 중앙에 위치
  var options = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top;

  window.open(event.currentTarget.href, '_blank', options);
}
