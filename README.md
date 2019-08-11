# 네이버 중고나라 카페 크롤링 실습자료

## 1. Ruby/Ruby on Rails 정보
* Ruby : 2.6.3
* Rails : 5.2.3

## 2. Tutorial
<img src="/public/img/example.png?raw=true" width="500px">

* 해당 실습자료는 네이버 중고나라 카페 크롤링 결과자료 입니다.
* 과정 참고 : https://github.com/kcm4674/ex_crawl/commits/master

## 3. 파일 소개
1. `lib/tasks/naver.rake` [<a target="_blank" href="/lib/tasks/naver.rake">이동</a>] 네이버 카페 크롤링 및 DB 저장
    * `rake "naver:market"` 입력 시, naver.rake 파일 작동
2. `app/controllers/n_cafe_controller.rb` [<a target="_blank" href="/app/controllers/n_cafe_controller.rb">이동</a>] @date_list 변수에 Market 모델 호출
3. `app/views/n_cafe/index.html.erb` [<a target="_blank" href="/app/views/n_cafe/index.html.erb">이동</a>] View를 통해 사람들에게 페이지를 렌더링 후 보여줍니다.

## 4. AWS Cloud9으로 프로젝트 가져가기

    git clone https://github.com/kcm4674/ex_crawl
    cd ex_crawl
    gem install rails --version=5.2.3
    bundle install
    rake db:drop; rake db:migrate; rake db:seed
    rails s
