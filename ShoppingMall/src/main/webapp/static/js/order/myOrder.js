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
        
        resetFilters();
        showAllRows();
        document.getElementById("order-table").style.display = "table";
        document.getElementById("cancel-table").style.display = "none";
    })
    
    // 취소 내역 조회 버튼 클릭 시
    btnCancel.addEventListener('click', () => {
        
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
        const fromDateInput = document.querySelector('input[name="dt_fr_input"]');
        const toDateInput = document.querySelector('input[name="dt_to_input"]');
        fromDateInput.value = '';
        toDateInput.value = '';
    }
    
    // 모든 행 보이기 함수
    function showAllRows() {
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
    
 })
 
      // 배송조회 새 창 설정하는 함수
       function openWindowWithPosition(url) {
        var left = (window.innerWidth - 500) / 2; // 가운데로 위치 조정
        var top = (window.innerHeight - 300) / 2; // 가운데로 위치 조정
        var options = 'width=500,height=500,top=' + top + ',left=' + left;
        window.open(url, '_blank', options);
    }
     