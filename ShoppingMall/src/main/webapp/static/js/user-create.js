/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const joinBtn = document.querySelector('button#joinBtn');
	
	joinBtn.addEventListener('click', () => {
		const loginId = document.querySelector('input#loginId').value;
		const name = document.querySelector('input#name').value;
		const phone = document.querySelector('input#phone').value;
		const email = document.querySelector('input#email').value;
		const emailConfirm = document.querySelector('input#emailConfirm').value;
		const password = document.querySelector('input#password').value;
		const passwordConfirm = document.querySelector('input#passwordConfirm').value;
		const street = document.querySelector('input#street').value;
		const detailAddress = document.querySelector('input#detailAddress').value;
		const postcode = document.querySelector('input#postcode').value;
		
		if(loginId === '') {
			alert('아이디를 입력해주세요.');
			return;
		}
		if(name === '') {
			alert('이름을 입력해주세요.');
			return;
		}
		if(phone === '') {
			alert('전화번호를 입력해주세요.');
			return;
		}
		if(email === '') {
			alert('이메일을 입력해주세요');
			return;
		}
		if(emailConfirm === '') {
			alert('이메일 인증번호를 입력해주세요.');
			return;
		}
		if(password === '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}
		if(passwordConfirm === '') {
			alert('비밀번호 확인을 입력해주세요.');
			return;
		}
		if(password !== passwordConfirm) {
			alert('비밀번호가 일치하지 않습니다.');
			return;
		}
		if(street === '') {
			alert('도로명 주소를 입력해주세요.');
			return;
		}
		if(detailAddress === '') {
			alert('상세 주소를 입력해주세요.');
			return;
		}
		if(postcode === '') {
			alert('우편번호를 입력해주세요.');
			return;
		}
	});
});