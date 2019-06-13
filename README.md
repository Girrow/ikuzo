# ikuzo

시작하면 git cmd 창에서 아래의 두개 본인것으로 바꾸어서 입력
======

**우선적으로 이 두개를 먼저 실행할 것
`
$ git config --global user.name "John Doe"

$ git config --global user.email johndoe@example.com
`

$ git clone https://github.com/girrow/ikuzo
------

**** or

| 넣을 값 | 의미 | 기본값 |
|:---:|:---:|:---:|
| `$ git pull` | 깃허브 서버에 변경사항이 있을 경우 변경사항을 내 레파지토리에 적용 | `git pull` |
| `$ git add .` | 내가 변경한 파일을 워킹디렉토리에 선정 | .을 사용시 전체, 아닐경우 직접 파일 적용 <br> `git add .` or `git add abc.txt` |
| `$ git commit -m ""` | 커밋 메세지를 적어서 add 넣은 파일들에 대한 메세지 설정 | `git commit -m "김수민 수정"` |
| `$ git push` | add , commit 한 파일들을 깃허브 서버에 전송하여 수정 | `git push` |


---

* CRLF 오류날 시
$ git config --global core.autocrlf true
------
