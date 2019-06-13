# -*- encoding: utf-8 -*-

#幸福行動診断テスト

module THEHOWOfHAPPINESS
  class Happiness_Behavior_Diagnostic_Test
    def initialize()
      #i = 0
      @data = Array.new(13).map{Array.new(6,0)}
      #while i <= 12 do
        #s = 0
        #while s <= 5 do
          #@data[i][s] = false
          #s = s + 1
        #end
        #i = i + 1
      #end


      #t = Time.now.strftime("%F %T")
      #s = 0
      #while s <= 12 do
        #@data[s][0] = t
      #end

      @data[0][0] = Time.now.strftime("%F %T")


@question1 = '
説明：次にあげる「幸福になるための１２の行動」のそれぞれについて、
    よく考えて下さい。
    長期間、これを毎週、実行すればどうなるかを考えましょう。
    それから、
    「自然である」「楽しい」「価値がある」「罪悪感を覚える」「やむを得ない」
    という項目の部分に１～７までのうちから当てはまる数字を記入し、
    それぞれの行動に点数をつけて下さい。

      '

@question2 = '
1　まったく当てはまりません
2
3
4　いくらか当てはまります
5
6
7　大いに当てはまります。
'
@question3 = '
人はさまざまな理由から行動を起こします。あなたがこの行動をとり続ける理由が以下の５つです。

【自然である】 ： 私がこの行動をとるのは、自分にとって自然な行動だと感じられ続けていくことが出来るからです。
【楽しい】    ： 私がこの行動をとるのは、そうするのが楽しくて、興味深く、チャレンジ精神をそそられるからです。
【価値がある】 ： 私がこの行動をとるのは、そうすることに価値があると思い、共感を覚えるからです。楽しくないときでさえ、自主的にこの行動を取りたいと思います。
【罪悪感を覚える】 ： 私がこの行動をとるのは、そうしなければ恥ずかしいし、罪悪感を覚えるし、不安になるからです。私は無理をしてでもこんな行動をとるでしょう。
【やむを得ない】 ： 私がこの行動をとるのは、誰かにしてほしいと言われているから、また状況上、そうするしかないからです。
'


      self.top()

    end

    def search_rand()
      i = false
        @data.each{|data|
          if data[0] == 0 then
            return true
          end
        }
      return i
    end

    def run()

      i = rand(13)
      #while @data.find{|data| data[0][0] == 0}[0] == 0 do
      while self.search_rand() == true do
        i = rand(13)

        if @data[i][0] == 0 then
          case i
          when 1 then
            @data[i][0] = Time.now.strftime("%F %T")
            self.one()
          when 2 then
            @data[i][0] = Time.now.strftime("%F %T")
            self.two()
          when 3 then
            @data[i][0] = Time.now.strftime("%F %T")
            self.three()
          when 4 then
            @data[i][0] = Time.now.strftime("%F %T")
            self.four()
          when 5 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.five()
          when 6 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.six()
          when 7 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.seven()
          when 8 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.eight()
          when 9 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.nine()
          when 10 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.ten()
          when 11 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.eleven()
          when 12 then
            @data[i][0] = Time.now.strftime("%F %T")
              self.twelve()
          else

          end
        end
      end

      begin
        # ファイルへ書き込み
        #CSV.open("Happiness_Behavior_Diagnostic_Test.csv", "a:UTF-8") do |csv|
          open("Happiness_Behavior_Diagnostic_Test.csv", "a:UTF-8") do |csv|
          #csv = @data[1][6] + "," + @data[2][6] + "," + @data[3][6] + "," + @data[4][6] + "," + @data[5][6] + "," + @data[6][6] + "," + @data[7][6] + "," + @data[8][6] + "," + @data[9][6] + "," + @data[10][6] + "," + @data[11][6] + "," + @data[12][6]

csv << @data[0][0].to_s + ","
csv << @data[1][6].to_s + ","
csv << @data[2][6].to_s + ","
csv << @data[3][6].to_s + ","
csv << @data[4][6].to_s + ","
csv << @data[5][6].to_s + ","
csv << @data[6][6].to_s + ","
csv << @data[7][6].to_s + ","
csv << @data[8][6].to_s + ","
csv << @data[9][6].to_s + ","
csv << @data[10][6].to_s + ","
csv << @data[11][6].to_s + ","
csv << @data[12][6].to_s + "\n"

        end
      rescue
        print "書き込みエラー\n".encode(Encoding::SJIS)
      end


      print ""
      print "結果 :\n"
      print "\n"
      self.result()

      self.top()

    end


  def top()
    print @question1
    print '
    次へ'
    i = gets.chomp.to_i
    print @question3
    print '
    < 幸福行動診断テスト >



    1　測定する
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
    open('Happiness_Behavior_Diagnostic_Test.csv', "r:UTF-8") do |f|
      print "過去ログ\n"

      CSV.new(f).each do |row|
        # ...
        print row[0] + "  「幸福になるための１２の行動」: \n"
        print '感謝の気持ちを表す                :' + row[1].to_s + "\n"
        print '楽感的な気持ちを高める            :' + row[2].to_s + "\n"
        print '考え過ぎない、他人と比較しない     :' + row[3].to_s + "\n"
        print '人に親切にする                    :' + row[4].to_s + "\n"
        print '人間関係を育む                    :' + row[5].to_s + "\n"
        print '問題に立ち向かうための対策をとる    :' + row[6].to_s + "\n"
        print '人を許す                          :' + row[7].to_s + "\n"
        print '心から打ち込める活動を増やす        :' + row[8].to_s + "\n"
        print '人生の喜びを深く味わう             :' + row[9].to_s + "\n"
        print '目標の達成に全力を尽くす           :' + row[10].to_s + "\n"
        print '宗教はスピリチュアルなものに関わる  :' + row[11].to_s + "\n"
        print '身体を大切にする                   :' + row[12].to_s + "\n\n\n"
      end

    end

    self.top()

  end


  def one()
      print @question2
      print'
感謝の気持ちを表す ：

自分が恵まれていることを数えるとか、これまできちんとお礼を言ったことにない相手に感謝やありがたいという思いを伝えること

'
      @data[1][0] = 1
      print '自然である       ：'
      @data[1][1] = gets.chomp.to_i
      print '楽しい          ：'
      @data[1][2] = gets.chomp.to_i
      print '価値がある       ：'
      @data[1][3] = gets.chomp.to_i
      print '罪悪感を覚える    ：'
      @data[1][4] = gets.chomp.to_i
      print '状況上やむを得ない ：'
      @data[1][5] = gets.chomp.to_i

      @data[1][6] = ((@data[1][1] + @data[1][2] + @data[1][3]) / 3 ) - ((@data[1][4] + @data[1][5]) / 2 )

      @data[1][0] = Time.now.strftime("%F %T")
    end

    def two()
      print @question2
      print'
楽感的な気持ちを高める ：

将来の最高の自分を想像したり、それについて日記に書いたり、あるいはどんな状況でも明るい面を見ること。

'
      @data[2][0] = 2
      print '自然である       ：'
      @data[2][1] = gets.chomp.to_i
      print '楽しい          ：'
      @data[2][2] = gets.chomp.to_i
      print '価値がある       ：'
      @data[2][3] = gets.chomp.to_i
      print '罪悪感を覚える    ：'
      @data[2][4] = gets.chomp.to_i
      print '状況上やむを得ない ：'
      @data[2][5] = gets.chomp.to_i

      @data[2][6] = ((@data[2][1] + @data[2][2] + @data[2][3]) / 3 ) - ((@data[2][4] + @data[2][5]) / 2 )

      @data[2][0] = Time.now.strftime("%F %T")
    end

    def three()
      print @question2
          print '
考え過ぎない、他人と比較しない ：

問題についてくよくよ悩んだり、自分と他人を比較したりしないために何かすること。

'
            @data[3][0] = 3
            print '自然である       ：'
            @data[3][1] = gets.chomp.to_i
            print '楽しい          ：'
            @data[3][2] = gets.chomp.to_i
            print '価値がある       ：'
            @data[3][3] = gets.chomp.to_i
            print '罪悪感を覚える    ：'
            @data[3][4] = gets.chomp.to_i
            print '状況上やむを得ない ：'
            @data[3][5] = gets.chomp.to_i

            @data[3][6] = ((@data[3][1] + @data[3][2] + @data[3][3]) / 3 ) - ((@data[3][4] + @data[3][5]) / 2 )

            @data[3][0] = Time.now.strftime("%F %T")
    end

    def four()
      print @question2
      i = 4
      print '
人に親切にする ：

相手が友人でも知らぬ人でも、直接にでも匿名でも、その場の偶然でも計画したものであっても、人に親切にすること。

'
        @data[i][0] = i
        print '自然である       ：'
        @data[i][1] = gets.chomp.to_i
        print '楽しい          ：'
        @data[i][2] = gets.chomp.to_i
        print '価値がある       ：'
        @data[i][3] = gets.chomp.to_i
        print '罪悪感を覚える    ：'
        @data[i][4] = gets.chomp.to_i
        print '状況上やむを得ない ：'
        @data[i][5] = gets.chomp.to_i

        @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

        @data[i][0] = Time.now.strftime("%F %T")
    end

def five()
  print @question2
  i = 5
  print '
人間関係を育む ：

もっと強めたい人間関係を選んで、それを深め、確認し、楽しむために時間やエネルギーを注ぎ込むこと。時には修復することも含む。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

def six()
  print @question2
  i = 6
  print '
問題に立ち向かうための対策をとる ：

最近のストレスや困難を克服したり、トラウマから学んだりする方法を身につけること。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

def seven()
  print @question2
  i = 7
  print '
人を許す ：

日記をつけたり手紙を書いたりして、あなたを傷つけたりひどい扱いをした人への怒りや恨みを手放そうとすること。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

def eight()
  print @question2
  i = 8
  print '
心から打ち込める活動を増やす ：

家庭や職場で「我を忘れる」ほど打ち込め、やりがいがあり没頭出来る体験を増やすこと。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

def nine()
  print @question2
  i = 9
  print '
人生の喜びを深く味わう ：

人生の喜びや驚きの瞬間にもっと注意を向け、そのことを味わい、思い出すこと。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

def ten()
  print @question2
  i = 10
  print '
目標の達成に全力を尽くす ：

自分にとって意味のある重要な目標を１～３つほど選び、時間を費やして追い求める努力をすること。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

def eleven()
  print @question2
  i = 11
  print '
宗教はスピリチュアルなものに関わる ：

教会や寺杜などにもっと足を運び、スピリチュアルなものをテーマにした本を読んだり、そうしたものについて考えたりすること。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

def twelve()
  print @question2
  i = 12
  print '
身体を大切にする ：

運動や瞑想を行うこと。

'
    @data[i][0] = i
    print '自然である       ：'
    @data[i][1] = gets.chomp.to_i
    print '楽しい          ：'
    @data[i][2] = gets.chomp.to_i
    print '価値がある       ：'
    @data[i][3] = gets.chomp.to_i
    print '罪悪感を覚える    ：'
    @data[i][4] = gets.chomp.to_i
    print '状況上やむを得ない ：'
    @data[i][5] = gets.chomp.to_i

    @data[i][6] = ((@data[i][1] + @data[i][2] + @data[i][3]) / 3 ) - ((@data[i][4] + @data[i][5]) / 2 )

    @data[i][0] = Time.now.strftime("%F %T")
end

    def result()

      print '感謝の気持ちを表す                :' + @data[1][6].to_s + "\n"
      print '楽感的な気持ちを高める            :' + @data[2][6].to_s + "\n"
      print '考え過ぎない、他人と比較しない     :' + @data[3][6].to_s + "\n"
      print '人に親切にする                    :' + @data[4][6].to_s + "\n"
      print '人間関係を育む                    :' + @data[5][6].to_s + "\n"
      print '問題に立ち向かうための対策をとる    :' + @data[6][6].to_s + "\n"
      print '人を許す                          :' + @data[7][6].to_s + "\n"
      print '心から打ち込める活動を増やす        :' + @data[8][6].to_s + "\n"
      print '人生の喜びを深く味わう             :' + @data[9][6].to_s + "\n"
      print '目標の達成に全力を尽くす           :' + @data[10][6].to_s + "\n"
      print '宗教はスピリチュアルなものに関わる  :' + @data[11][6].to_s + "\n"
      print '身体を大切にする                   :' + @data[12][6].to_s + "\n"

      #return
    end
  end
end
