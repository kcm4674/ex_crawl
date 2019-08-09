# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

## ↓ 해당 설정을 안해주면, 자동작업 시간은 영국시간 기준을 따르며 일하게 됨.
require "tzinfo"
 
# 자동작업 시계(Clock)를 '대한민국' 시간으로 맞추는 작업
def local(time)
    TZInfo::Timezone.get('Asia/Seoul').local_to_utc(Time.parse(time))
end
## ↑ 대한민국 시간 설정 종료

# 매 1분마다 [rake naver:market] 명령어 입력을 통해 해당 파일 내 코드가 작동되도록 설정
every 1.minutes do
    rake "naver:market", :environment => "development"
    rake "naver:market", :environment => "production"
end


### whenever 자세한 사용법 참고 ###
# https://blog.naver.com/kbs4674/221197430824