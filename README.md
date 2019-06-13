# ikuzo

- 시작하면 git cmd 창에서 아래의 두개 본인것으로 바꾸어서 입력
 - 우선적으로 이 두개를 먼저 실행할 것
   - `$ git config --global user.name "John Doe"`<br>
   - `$ git config --global user.email johndoe@example.com`

**github 파일을 받겠다는 명령어 <기준 : 현재 github>

그냥 따라하면 되는 순서

0. 아직 디렉토리가 구성되지 않았을 시 내가 원하는 폴더 디렉토리로 우선적으로 이동<br>
0-1. $ git clone https://github.com/girrow/ikuzo 파일 다운로드 

---
반복 구간
---
### 1.git pull <무조건 항상 파일을 수정하고 add,commit 전에 해야할 것>
2. 내 이름의 파일을 수정 및 삽입
3. $ git add . <내가 수정한 파일 추가 (깃허브 서버가 아닌 내 컴퓨터 가상 공간에 )>
4. $ git commit -m "수정커밋 내용" <add로 파일 추가한 내용을 커밋으로 메세지 지정>
5. $ git push

*** conflict 오류가 났을 시 :wq를 통해서 에디터 폴더 나와서 강제로 합치기


| 넣을 값 | 의미 | 기본값 |
|:---:|:---:|:---:|
| `$ git pull` | 깃허브 서버에 변경사항이 있을 경우 변경사항을 내 레파지토리에 적용 | `git pull` |
| `$ git add .` | 내가 변경한 파일을 워킹디렉토리에 선정 | .을 사용시 전체 <br> `git add .` or `git add abc.txt` |
| `$ git commit -m ""` | 커밋 메세지를 적어서 add 넣은 파일들 메세지 설정 | `git commit -m "김수민 수정"` |
| `$ git push` | add , commit 한 파일들을 깃허브 서버에 전송하여 수정 | `git push` |


---

* CRLF 오류날 시

`$ git config --global core.autocrlf true`
------
