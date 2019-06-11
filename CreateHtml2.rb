# -*- encoding: utf-8 -*-

require "erb"
require "./Config/Config"


class CreateHtml
  attr_accessor :keyword, :link, :hiduke, :day, :title, :config, :page
  def initialize(page)
    @config = Config.new()
    @page = page

    @doctype = "<!doctype html>
    <html>"

    @doctype2 = "</html>"

    @head            = File.open("./template/head.html", 'r:utf-8').read
    @header          = File.open("./template/header.html", 'r:utf-8').read
    @nav             = File.open("./template/nav.html", 'r:utf-8').read
    @aside           = File.open("./template/aside.html", 'r:utf-8').read
    #@article         = File.open("./template/article.html", 'r:utf-8').read
    @footer          = File.open("./template/footer.html", 'r:utf-8').read
    @body            = File.open("./template/body.html", 'r:utf-8').read
    @autoupload_lftp = File.open("./Config/autoupload.lftp", 'r:utf-8').read

    # メタheadを取り出す
    i = @head.match(/<head.*?>(.*?)<\/head>/m)
    if $1 == nil then
      print "読み込みエラー head" + @page.get_dir_name() + "\n"
      @head = ""
    else
      @head = $1
    end

    # headerを取り出す
    i = @header.match(/<header.*?>(.*?)<\/header>/m)
    if $1 == nil then
      print "読み込みエラー header" + @page.get_dir_name() + "\n"
      @header = ""
    else
      @header = $1
    end

    # navを取り出す
    i = @nav.match(/<nav.*?>(.*?)<\/nav>/m)
    if $1 == nil then
      print "読み込みエラー nav" + @page.get_dir_name() + "\n"
      @nav = ""
    else
      @nav = $1
    end

        # asideを取り出す
        i = @aside.match(/<aside.*?>(.*?)<\/aside>/m)
        if $1 == nil then
          print "読み込みエラー aside" + @page.get_dir_name() + "\n"
          @aside = ""
        else
          @aside = $1
        end

                # footerを取り出す
                i = @footer.match(/<footer.*?>(.*?)<\/footer>/m)
                if $1 == nil then
                  print "読み込みエラー footer" + @page.get_dir_name() + "\n"
                  @footer = ""
                else
                  @footer = $1
                end


    # ボディを取り出す
    i = @body.match(/<body.*?>(.*?)<\/body>/m)
    if $1 == nil then
      print "読み込みエラー body" + @page.get_dir_name() + "\n"
      @body = ""
    else
      @body = $1
    end


    self.keyword()
    self.lftp()
  end

  def keyword()
    @keyword = ""
    @config.home_category.each{|key|
      @keyword = "#{@keyword}, " + "#{key}"
    }
    return @keyword.encode!("UTF-8")
  end

  def create_body()
    # くっつける

    @html = @doctype + @header + @body + @footer + @doctype2
    #p changelogmemo

    @html.gsub!("&lt;", "<")
    @html.gsub!("&gt;", ">")


    erb = ERB.new(@html)

    @html = erb.result(binding)

    begin
      File.write("./www/" + @page.get_dir_name + "/" + "index.html", @html)
    rescue
      print "書き込みエラー\n" + @page.get_dir_name + "\n"
    end

  end

  def create_body_index()
    # くっつける
    #header = @header.gsub("./../image", "./image")
    #body = @body.gsub("./../image", "./image")
    #footer = @footer.gsub("./../image", "./image")

    html = @doctype + @header + @body + @footer + @doctype2
    #p changelogmemo

    html.gsub!("&lt;", "<")
    html.gsub!("&gt;", ">")

    erb = ERB.new(html)

    html = erb.result(binding)

    begin
      File.write("./www/" + "index.html", html)
    rescue
      print "書き込みエラー\n" + @page.get_dir_name + "\n"
    end
  end

  def lftp()
    erb = ERB.new(@autoupload_lftp)
    lftp = erb.result(binding)

    begin
      File.write("./Config/autoupload.lftp", lftp)
    rescue
      print "書き込みエラー\n"
    end
  end

end

class Page
  def initialize(dir)
    @dir = dir
  end

  def get_dir_name()
    return @dir.sub("./template/", "")
  end

  def get_title()
    title = File.open(@dir + "/title.txt", 'r:utf-8').read
    return title
  end

  def get_description()
    description = File.open(@dir + "/description.txt", 'r:utf-8').read
    return description
  end

  def get_article()
    article = File.open(@dir + "/article.html", 'r:utf-8').read
    article.scan(/<article.*?>(.*?)<\/article>/m)
    article = $1
    return article
  end
end

# ディレクトリ一覧取得
pages = []
Dir.glob('./contents/*').each{|dir|
  unless Dir.exist?(dir) then
    #print dir
  else
    pages << Page.new(dir)
  end
}



# HP作成
pages.each{|page|
  create_html = CreateHtml.new(page)
  create_html.create_body_index()
  create_html.create_body()
}
