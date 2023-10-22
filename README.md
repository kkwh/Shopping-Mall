# 전통주 쇼핑몰 주랑주랑

<img src="https://user-images.githubusercontent.com/126144148/254469373-67430ae5-2fc7-4eca-949f-b63a809fca00.png">

**당신을 위한 완벽한 전통주!**


전국 각지의 술들이 궁금하지 않으신가요?

편의점에는 없어요. 마트에도 없습니다.

색다른 술이 먹고 싶은데.., 특별한 날에 뭐 먹지?

주랑주랑, 최적의 선택입니다

<br/>

## 💻 프로젝트 설명

- **프로젝트 명칭**: 주랑주랑
- **제작 기간**: 2023년 6월 1일 ~ 2023년 6월 22일
- **참여 인원**: 6명
- **개발 언어**: Java
- **프로젝트 소개**: 주랑주랑은 소주, 맥주를 포함하여 다양한 종류의 주류와 전통주를 메인으로 판매하는 사이트입니다. 보통 사람들이 흔히 접할 수 없는 우리나라 전국 각지의 색다른 술을 판매하기 위해서 쇼핑몰 프로젝트를 기획하게 되었습니다. 상품 조회, 장바구니 및 주문, 주문 조회, 배송, 문의, 리뷰 등 실제 쇼핑몰 사이트에서 사용되는 기능들을 모두 구현하였습니다.
- **개발 파트**:
  - 주문, 주문취소
  - 주문 내역 조회, 주문 취소 내역 조회
  - 배송, 배송조회



<br/>

## 🛠 기술 스택
- Spring 5.1.5 / Oracle / MyBatis / JSP / Maven / Java 17
- 통합 개발 환경 (IDE): Eclipse

<br/>

## 🧱 데이터베이스 설계 (ERD)
![project_erd](https://github.com/WonjunS/Shopping-Mall/assets/93713151/be867310-1f1a-4f92-97e9-fc1f5bdb21f9)

<br/>

## 🍷 프로젝트 실행 화면

<div>
    <ul>
        <li>
            <strong>메인 페이지</strong>
            <ul>
                <li>로그인/회원가입</li>
                <li>상품페이지, 공지사항/이벤트</li>
                <li>이벤트 배너</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257471715-de67f77a-885d-417a-824e-7147d792662d.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>로그인</strong>
            <ul>
                <li>회원가입</li>
                <li>아이디 찾기/비밀번호 찾기</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257481908-525d8b35-173a-4f70-87a2-805b24cdb7d0.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>내정보 수정</strong>
            <ul>
                <li>회원정보 수정</li>
                <li>회원 탈퇴</li>              
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257487561-2392ae33-88b3-453c-a0db-0183fd295ecf.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>문의 리스트</strong>
            <ul>
                <li>문의 내역 확인</li>
                <li>문의 작성</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257487718-f01cb106-f690-4ea1-bcdc-36d4cc12a55c.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>문의 상세 화면</strong>
            <ul>
                <li>문의 내용 확인</li>
                <li>문의 수정(변경/삭제)</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257488029-5bda848f-ccaf-43db-86f9-a7d412e0819e.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>게시글 리스트</strong>
            <ul>
                <li>공지/이벤트 구분</li>
                <li>페이징 처리</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257488380-7f72eac5-ed54-45ec-8a52-8614314d3c4b.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>게시글 상세 화면</strong>
            <ul>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257488895-ce225b62-6eed-4697-b92a-05d5fc71b2f7.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>상품 리스트</strong>
            <ul>
                <li>카테고리 별 조회</li>
                <li>전체 검색</li>
                <li>상세 검색</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257489263-89338e09-27f1-48e9-b3ee-92c59800d082.png">
                </li>
            </ul>
        </li>
        <li>
            <strong>상품 상세 화면</strong>
            <ul>
                <li>제품 옵션</li>
                <li>장바구니</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257489486-2ec58325-2fcf-4f96-9ea7-477be1250893.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>장바구니창 페이지</strong>
            <ul>
                <li>수량 변경 가능</li>
                <li>개별 삭제</li>
                <li>전체 삭제</li>
                <li>예상 금액</li>
                <li>주문하기로 이동</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257489720-0cc82300-b4d3-49c0-a29c-b82bc1c64d47.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>주문페이지</strong>
            <ul>
                <li>상품 정보</li>
                <li>주문자 정보</li>
                <li>배송지 정보/동일입력 가능</li>
                <li>포인트 사용</li>
                <li>결제 옵션 선택</li>
                <li>최종 결제 정보 확인</li>
                <li>결제하기</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257490097-ab8af651-9f28-44ce-a4d5-d635120e3d09.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>주문 내역</strong>
            <ul>
                <li>주문 정보/취소 내역</li>
                <li>날짜/카테고리 별 정렬</li>
                <li>주문상태에 따른 다른 버튼 활성화</li>
                <li>배송조회</li>
                <li>주문취소/구매확정/후기작성</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257490409-700c6a61-a02f-4e87-ba13-3ec1f6a650b0.png">
                </li>
            </ul>
        </li>
        <br/>
        <li>
            <strong>결제</strong>
            <ul>
                <li>신용카드 결제 또는 카카오페이 중 결제 방식 선택</li>
                <li>
                    <img src="https://user-images.githubusercontent.com/126144148/257490626-84b3f2e5-51f5-42d6-b95c-50e3bb0ae737.png">
                </li>
            </ul>
        </li>
        <li>
              <strong>리뷰 목록</strong>
              <ul>
                  <li>리뷰 조회</li>
                  <li>
                      <img src="https://user-images.githubusercontent.com/126144148/257492323-f678e210-786a-4106-8155-dfbba9ab1f31.png">
                  </li>
              </ul>
          </li>
          <br/>
          <li>
                  <strong>리뷰 작성</strong>
                  <ul>
                      <li>별점</li>
                      <li>등록/취소</li>
                      <li>
                          <img src="https://user-images.githubusercontent.com/126144148/257492600-a203f24a-9eba-4287-b3d6-26cbe993b65c.png">
                      </li>
                  </ul>
              </li>
              <br/>
            <li>
                  <strong>관리자 페이지</strong>
                  <ul>
                      <li>날짜/카테고리 별 정렬</li>
                      <li>목록 조회</li>
                      <li>제품 추가</li>
                      <li>검색</li>
                      <li>수정, 삭제</li>
                      <li>
                          <img src="https://user-images.githubusercontent.com/126144148/257494242-eabbecda-fd4a-44f6-b85c-a1789a1213fc.png">
                      </li>
                  </ul>
              </li>
              <br/>
    </ul>
</div>

<br/>

## 👨🏻‍💻 프로젝트 멤버

|            [원준](https://github.com/WonjunS)             |            [한별](https://github.com/blackhabin)               |             [우현](https://github.com/kkwh)             |             [선아](https://github.com/seonaK)             |              [세엽](https://github.com/sayyoup)               |             [태욱](https://github.com/ctw6413)             |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/93713151?v=4" width=200px alt="_"/> | <img src="https://avatars.githubusercontent.com/u/126144148?v=4" width=200px alt="_"/> | <img src="https://avatars.githubusercontent.com/u/121307297?v=4" width=200px alt="_"/> | <img src="https://avatars.githubusercontent.com/u/134375418?v=4" width=200px alt="_"> | <img src="https://avatars.githubusercontent.com/u/123839647?v=4" width=200px alt="_"> | <img src="https://avatars.githubusercontent.com/u/83942153?v=4" width=200px alt="_"> |
|                         🌱 팀장                         |                         🌱 부팀장                        |                           🌵 만화                           |                           🌷 메이플                           |                           🌻 공룡                           |                           🌾 E                            |
