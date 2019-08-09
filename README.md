# CRUD / Comment / Devise(with 한글화)

## 1. Ruby/Ruby on Rails 정보
* Ruby : 2.6.3
* Rails : 5.2.3

## 2. Tutorial
* 해당 예제는 다음 실습 때 쓰입니다.
    * M:N 데이터 관계 실습
    * Comment 비동기처리
    * Devise 한글화
    * 외부 로그인 연동
    * ... (그 외 devise 및 Comment를 활용하는 것) ...

## 3. AWS Cloud9으로 프로젝트 가져가기

    git clone https://github.com/kcm4674/ex_devise
    cd ex_devise
    gem install rails --version=5.2.3
    bundle install
    rake db:drop; rake db:migrate; rake db:seed
    rails s
