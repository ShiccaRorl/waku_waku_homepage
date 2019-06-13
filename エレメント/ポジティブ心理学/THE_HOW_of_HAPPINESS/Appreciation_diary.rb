# -*- encoding: utf-8 -*-

#幸福度スケール

module THEHOWOfHAPPINESS
  class Appreciation_diary
    def initialize()
      @data = []
      @data[0] = Time.now.strftime("%F %T")

      @question = '
      < 感謝日記 >

一行で済ませて下さい。
      '

      self.top()

    end

    def run()

      @data[1] = gets.chomp

      begin
        # ファイルへ書き込み
        open("Appreciation_diary.csv", "a:utf-8") do |csv|
          csv << @data[0] + ","
          csv << @data[1] + "\n"
        end
      rescue
        print "書き込みエラー"
      end

      self.top()

    end

    def top()
      print '
    < 感謝日記 >

    1　日記を書く
    2　過去のデータを見る
    0　戻る

    '

      i = gets.chomp.to_i

      case i
      when 1 then
        self.run()
      when 2 then
        self.past_log()
      when 0 then

      else
        self.top()
      end
    end

    def past_log()
      begin
        File.open('Appreciation_diary.csv', "r:sjis") {|file|
          print "過去ログ\n"
          file.each{|line|
            print line.split(",")[0] + " : " + line.split(",")[1]
          }

        }
      rescue
        print "読み込みエラー"
      end

      self.top()

    end
  end
end
