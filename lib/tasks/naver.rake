namespace :naver do
  desc "TODO"
  task market: :environment do
    require 'selenium-webdriver'
    Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp # 설치한 크롬 드라이버 사용
    
    ## 헤드리스 개념
    # https://beomi.github.io/2017/09/28/HowToMakeWebCrawler-Headless-Chrome/
    options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
    options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
    options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
    
    # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 2개 실행
    @browser = Selenium::WebDriver.for :chrome, options: options
    @browser2 = Selenium::WebDriver.for :chrome, options: options
    
    # [첫 번째 브라우저] 로그인 페이지 가기
    browser = @browser.get 'https://nid.naver.com/nidlogin.login'
    # [첫 번째 브라우저] 여러 Form중에 id="id"인 Form을 가리킨 후, 아이디 입력
    inputID = @browser.find_element(id: "id").send_keys "#{ENV['NAVER_ID']}"
    # [첫 번째 브라우저] 여러 Form중에 id="id"인 Form을 가리킨 후, 비밀번호 입력
    inputPW = @browser.find_element(id: "pw").send_keys "#{ENV['NAVER_PW']}"
    # [첫 번째 브라우저] '로그인' 버튼 클릭
    @browser.find_element(class: "btn_global").click
    
    # [두번째 브라우저] 로그인 페이지 가기
    browser2 = @browser2.get 'https://nid.naver.com/nidlogin.login'
    # [두번째 브라우저] 여러 Form중에 id="id"인 Form을 가리킨 후, 아이디 입력
    inputID2 = @browser2.find_element(id: "id").send_keys "#{ENV['NAVER_ID']}"
    # [두번째 브라우저] 여러 Form중에 id="id"인 Form을 가리킨 후, 비밀번호 입력
    inputPW2 = @browser2.find_element(id: "pw").send_keys "#{ENV['NAVER_PW']}"
    # [두번째 브라우저] '로그인' 버튼 클릭
    @browser2.find_element(class: "btn_global").click
    
    # 다음 페이지로 이동
    @browser.navigate().to "https://m.cafe.naver.com/ArticleList.nhn?search.clubid=10050146&search.menuid=334&search.boardtype=L"
    
    ## find_element랑 find_elements의 차이를 꼭 알아두자.
    # https://stackoverflow.com/a/14425080
    @content = @browser.find_elements(css: 'ul.list_area > li')
    
    @content.each do |t|
      @title = t.find_element(css: "strong.tit").text
      @nickname = t.find_element(css: "span.ellip").text
      @date = t.find_element(css: "span.time").text
      @url = t.find_element(tag_name: "a").attribute("href")
      
      @browser2.navigate().to "#{@url}" # 현재 확인하는 URL을 참고하여 두번 째 브라우저가 URL 열람
      @inner_content = @browser2.find_elements(css: "div#postContent") # 현재 확인하는 URL에 접속 후, 게시글 내용을 크롤링
      
      @contents = "" # @contents 변수가 '정수' 임을 정의
      @inner_content.each do |x|
         @contents = @contents + "#{x.text}" # 현재 게시글 내용 한 줄 마다 <div>인 상태여서 이를 하나로 뭉치는 작업
      end
      
      ## 서버 로그 확인용
      # puts "제목 : #{@title} / 닉네임 : #{@nickname} / 내용 : #{@contents}"
      
      ## DB 생성
      Market.create(title: @title, nickname: @nickname, content: @contents, date: @date, url: @url)
    end
    
    @browser.quit
    @browser2.quit
  end

end
