# -*- encoding: utf-8 -*-

#幸福度スケール

module THEHOWOfHAPPINESS
  class Oxford_happiness_survey
    def initialize()
      i = 0
      @data = []
      while i <= 29 do
        @data << false
        i = i + 1
      end

      @data[0] = Time.now.strftime("%F %T")

      @question = '
      < オックスフォード幸福度調査 >

      説明：以下にあげる２９の文章は、幸福についてのべています。
      それぞれの言葉にあなたがどれくらい賛成か、あるいは賛成しないかについて、
      下の１～６までのうちで当てはまるものの番号を各文書に記入してください。

      １　まったくそう思わない
      ２　そう思わない
      ３　あまりそう思わない
      ４　少しそう思う
      ５　そう思う
      ６　まったくそう思う
      '

      self.top()

    end

    def run()
      while @data.find{|data| data == false } == false do
        i = rand(30)

        if @data[i] == false then
          case i
          when 1 then
            self.one()
          when 2 then
            self.two()
          when 3 then
            self.three()
          when 4 then
            self.four()
          when 5 then
            self.number5()
          when 6 then
            self.number6()
          when 7 then
            self.number7()
          when 8 then
            self.number8()
          when 9 then
            self.number9()
          when 10 then
            self.number10()
          when 11 then
            self.number11()
          when 12 then
            self.number12()
          when 13 then
            self.number13()
          when 14 then
            self.number14()
          when 15 then
            self.number15()
          when 16 then
            self.number16()
          when 17 then
            self.number17()
          when 18 then
            self.number18()
          when 19 then
            self.number19()
          when 20 then
            self.number20()
          when 21 then
            self.number21()
          when 22 then
            self.number22()
          when 23 then
            self.number23()
          when 24 then
            self.number24()
          when 25 then
            self.number25()
          when 26 then
            self.number26()
          when 27 then
            self.number27()
          when 28 then
            self.number28()
          when 29 then
            self.number29()
          else

          end
        end
      end



=begin
open('Happiness_scale.csv', "w:UTF-8") do |f|
  CSV.new(f).each do |row|
    # ...
  end

end
=end
      begin
        # ファイルへ書き込み
        CSV.open("Oxford_happiness_survey.csv", "a:UTF-8") do |csv|
          csv << @data
        end
      rescue
        p "書き込みエラー".encode(Encoding::SJIS)
      end

      print ""
      print "結果 :" + self.result().to_s
      print '

      '
      @data[30] = self.result().to_s


      self.top()

    end

    def top()
      print '
    < オックスフォード幸福度調査 >

    を測定します。

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
      open('Oxford_happiness_survey.csv', "r:UTF-8") do |f|
        print "過去ログ\n"

        CSV.new(f).each do |row|
          # ...
          print row[0] + " 幸福度 : " + row[29] + "\n"
        end

      end

      self.top()

    end

    def one()
      print @question
      print'
      私は自分の生き方にあまり満足していない。
      '
      @data[1] = self.reverse(gets.chomp.to_i)
    end

    def two()
      print @question
      print '
      私は他人に強く関心をもっている
      '
      @data[2] = gets.chomp.to_i
    end

    def three()
      print @question
      print '
      人生は十分に報われるものだと感じる
      '
      @data[3] = gets.chomp.to_i
    end

    def four()
      print @question
      print '
      ほとんど誰にでも温かい気持ちになれる。
      '
      @data[4] = gets.chomp.to_i
    end

    def number5()
      print @question
      print '
  私はスッキリとめざめることはあまりない。
  '
      @data[5] = self.reverse(gets.chomp.to_i)
    end

    def number6()
      print @question
      print '
  私は将来についてあまり楽観的ではない。
  '
      @data[6] = self.reverse(gets.chomp.to_i)
    end

    def number7()
      print @question
      print '
  私はたいていのことを面白いと思う。
  '
      @data[7] = gets.chomp.to_i
    end

    def number8()
      print @question
      print '
  私はいつも何かに専念し、夢中になっている。
  '
      @data[8] = gets.chomp.to_i
    end

    def number9()
      print @question
      print '
  人生はすばらしいものだ。
  '
      @data[9] = gets.chomp.to_i
    end

    def number10()
      print @question
      print '
  私はこの世の中がいいとは思えない。
  '
      @data[10] = self.reverse(gets.chomp.to_i)
    end

    def number11()
      print @question
      print '
  私はよく笑う。
  '
      @data[11] = gets.chomp.to_i
    end

    def number12()
      print @question
      print '
  私は人生のあらゆるものにとても満足している。
  '
      @data[12] = gets.chomp.to_i
    end

    def number13()
      print @question
      print '
  私は自分が魅力的だとは思えない。
  '
      @data[13] = self.reverse(gets.chomp.to_i)
    end

    def number14()
      print @question
      print '
  私がやりたいことと、これまでやってきたこととの間にはギャップがある。
  '
      @data[14] = self.reverse(gets.chomp.to_i)
    end

    def number15()
      print @question
      print '
  私はとても幸せである。
  '
      @data[15] = gets.chomp.to_i
    end

    def number16()
      print @question
      print '
  何かを見て美しいと思う。
  '
      @data[16] = gets.chomp.to_i
    end

    def number17()
      print @question
      print '
  私はいつも人に元気を与える。
  '
      @data[17] = gets.chomp.to_i
    end

    def number18()
      print @question
      print '
  私はやりたいことを何でもできる時間がある。
  '
      @data[18] = gets.chomp.to_i
    end

    def number19()
      print @question
      print '
  私は思い通りの人生を歩んでいない。
  '
      @data[19] = self.reverse(gets.chomp.to_i)
    end

    def number20()
      print @question
      print '
  私はほしいものは何でも手に入れられると思う。
  '
      @data[20] = gets.chomp.to_i
    end

    def number21()
      print @question
      print '
  私は頭の回転が早い。
  '
      @data[21] = gets.chomp.to_i
    end

    def number22()
      print @question
      print '
  私はよく喜びを感じ、高揚感を覚える。
  '
      @data[22] = gets.chomp.to_i
    end

    def number23()
      print @question
      print '
  私が何かを決めるのは簡単ではない。
  '
      @data[23] = self.reverse(gets.chomp.to_i)
    end

    def number24()
      print @question
      print '
  私は自分の人生に特別な意味や目的を見いだせない。
  '
      @data[24] = self.reverse(gets.chomp.to_i)
    end

    def number25()
      print @question
      print '
  私は活力に満ちあふれている。
  '
      @data[25] = gets.chomp.to_i
    end

    def number26()
      print @question
      print '
  私は物事にポジティブな影響を与えることが多い。
  '
      @data[26] = gets.chomp.to_i
    end

    def number27()
      print @question
      print '
  私は人と一緒にいても楽しくない。
  '
      @data[27] = self.reverse(gets.chomp.to_i)
    end

    def number28()
      print @question
      print '
  私は特に健康だとは感じない。
  '
      @data[28] = self.reverse(gets.chomp.to_i)
    end

    def number29()
      print @question
      print '
  過去にとりたてて幸せだった思い出はない。
  '
      @data[29] = self.reverse(gets.chomp.to_i)
    end

    def reverse(i)
      case i
      when 1 then
        return 6
      when 2 then
        return 5
      when 3 then
        return 4
      when 4 then
        return 3
      when 5 then
        return 2
      when 6 then
        return 1
      else
      end

    end

    def result()
      print @data
      p @data.size
      return ((@data[1] + @data[2] + @data[3] + @data[4] + @data[5] + @data[6] + @data[7] + @data[8] + @data[9] + @data[10] + @data[11] + @data[12] + @data[13] + @data[14] + @data[15] + @data[16] + @data[17] + @data[18] + @data[19] + @data[20] + @data[21] + @data[22] + @data[23] + @data[24] + @data[25] + @data[26] + @data[27] + @data[28] + @data[29]) / 29).to_f
    end
  end
end
