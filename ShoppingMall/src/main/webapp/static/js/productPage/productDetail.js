/**
 * productDetail.js
 */

/**
 *채한별 작업중...왜 안될까... 
 */
document.addEventListener('DOMContentLoaded', () => {

    const btnAddRecommend = document.querySelector('button#recommend');
/*    
    const recommendCreate = (e) => {
        const u_id = document.querySelector('input#u_id').value;;
        const p_id = document.querySelector('input#p_id').value;
    
    
    const data = { u_id, p_id };
    
    axios.post('/joo/product/recommendCreate', data)
            .then((response) => {
                alert(`등록완료(${response.data})`);
           
            })
            .catch((error) => {
                console.log(error);
            });
        };
        btnAddRecommend.addEventListener('click', recommendCreate);
        
        
       const btnAddRecommend =document.querySelector('button#recommend');
    */   
       btnAddRecommend.addEventListener('click', () => {
           const u_id = document.querySelector('input#u_id').value;;
           const p_id = document.querySelector('input#p_id').value;
        
            form.action='/joo/product/recommendCreate';
            form.method='post';
            form.submit();
       })
});


    
    
    
