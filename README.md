# Git 커밋 메시지 작성 규칙

**커밋 메시지 구조:**
<br>
type: subject
<br>
body
<br>
footer

<br>

**커밋 메시지 제목 구조:**
<br>
[본인_이름] 타입: 제목

- 타입은 영어로 작성하고, 첫 글자는 대문자로 작성
- 메시지 제목은 한글로 작성하고, 필요한 경우에만 영어로 작성
- 메시지 제목에는 핵심만 작성하고, 본문에 자세한 변경 사항 등을 작성

ex) 
- [서원준] Feat: Member 클래스 작성
- [서원준] Fix: MemberService 클래스 버그 수정

<br>

**커밋 메시지 본문**
- 본문에는 해당 작업에서 수행했던 상세한 변경 사항(기능 추가/수정/삭제) 등을 기입
- 본문 내용은 한글로 작성하고, 필요한 경우에만 영어로 작성


참조: https://cocoon1787.tistory.com/708

<hr>

# Git Command 사용하기
GitHub Repository에서 로컬로 프로젝트 불러오기:
1. cd 파일_경로를 사용해서 프로젝트 작업할 directory로 이동
2. git init (저장소 생성)
3. git clone [https://github.com/itwill-project/Shopping-Mall.git] (프로젝트 클론)
4. Eclipse 실행후 clone한 프로젝트 import

<br>

작업후 프로젝트 commit 하는법:
1. git status (변경 상태 체크)
2. git add [file_name] (특정 파일 stage)
3. git commit -m "커밋_메시지" (커밋)
4. git push origin [your_branch_name] (원격 저장소로 커밋 업로드)
5. git pull origin [branch_name] (원격 저장소의 내용 가져와 병합)

<br>

브랜치 관련 커멘드:
1. git checkout [branch_name] (브랜치 이동)
2. git branch (브랜치 목록 보기)
3. git checkout -b [branch_name] (새 브랜치 생성)
4. git branch -D [branch_name] (브랜치 삭제)
5. git branch -m [branch_name] (브랜치 이름 변경)


참조: 
<br>
https://velog.io/@jinuku/Git-%ED%98%91%EC%97%85-%EA%B0%80%EC%9D%B4%EB%93%9C
<br>
https://sumini.dev/guide/011-how-to-work-with-git/
