# -*- encoding: utf-8 -*-

#幸福度スケール

module THEHOWOfHAPPINESS
  class Happiness_scale
    def initialize()
      i = 0
      @data = []
      while i <= 4 do
        @data << false
        i = i + 1
      end

      @data[0] = Time.now.strftime("%F %T")

      @question = '
      < 幸福度スケール >

      説明：以下の質問のそれぞれについて、自分に最も合っていると思われる番号に
      丸をつけて下さい。
      （４つの項目は、1から7までの段階の内容がそれぞれ違うので、注意して下さい）

      '

      self.top()

    end

    def run()
      while @data.find{|data| data == false } == false do
        i = rand(5)

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
          else

          end
        end
      end

      print ""
      print "結果 :" + self.result().to_s
      print '

      平均点　4.5～5.0
      '
      @data[5] = self.result().to_s

=begin
open('Happiness_scale.csv', "w:UTF-8") do |f|
  CSV.new(f).each do |row|
    # ...
  end

end
=end
      begin
        # ファイルへ書き込み
        CSV.open("Happiness_scale.csv", "a:UTF-8") do |csv|
          csv << @data
        end
      rescue
        p "書き込みエラー".encode(Encoding::SJIS)
      end

    self.top()

    end


  def top()
    print '
    < 幸福度スケール >

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
    open('Happiness_scale.csv', "r:UTF-8") do |f|
      print "過去ログ\n"

      CSV.new(f).each do |row|
        # ...
        print row[0] + " 幸福度 : " + row[5] + "\n"
      end

    end

    self.top()

  end


  def one()
      print @question
      print'
      全体として、私はこう思います

      1　幸せな人間ではありません
      2
      3
      4
      5
      6
      7　とても幸せな人間です

      '
      @data[1] = gets.chomp.to_i
    end

    def two()
      print @question
      print '
      たいていの同僚と比べて、私はこう思います

      1　彼らよりも幸せではありません
      2
      3
      4
      5
      6
      7　彼らよりも幸せです

      '
      @data[2] = gets.chomp.to_i
    end

    def three()
      print @question
      print '
      全体としてとても幸せだという人々がいます。
      そういう人たちは何が起きていても人生を楽しみ、
      どんなことも最大限活用しています。
      このような性格はあなたにどの程度当てはまりますか？

      1　まったく当てはまりません
      2
      3
      4
      5
      6
      7　大いに当てはまります

      '
      @data[3] = gets.chomp.to_i
    end

    def four()
      print @question
      print '
      全体としてあまり幸せではないという人々がいます。
      そういう人たちは落ち込んでいるわけではないのですが、
      願っているほど幸せになれたことはありません。
      このような性格はあなたにどの程度当てはまりますか？

      1　大いに当てはまります
      2
      3
      4
      5
      6
      7　まったく当てはまりません

      '
      @data[4] = gets.chomp.to_i
    end

    def result()
      return ((@data[1] + @data[2] + @data[3] + @data[4]) / 4).to_f
    end
  end
end