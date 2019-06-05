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

    @header          = File.open("./Config/template/index/header.html", 'r:utf-8').read
    @footer          = File.open("./Config/template/index/footer.html", 'r:utf-8').read
    @body            = File.open("./Config/template/index/body.html", 'r:utf-8').read
    @autoupload_lftp = File.open("./Config/autoupload.lftp", 'r:utf-8').read

    # bodyだけを取り出す。
    @body.gsub!("\n", "")

    i = @body.match(/(<body.*?>(.*?)<\/body>)/m)
    if $1 == nil then
      print @page.get_dir_name() + " body " + "\n"
      @body = ""
    else
      @body = $1
    end

    # ヘッダを取り出す。
    i = @header.match(/(<head.*?>(.*?)<\/head>)/m)
    if $1 == nil then
      print @page.get_dir_name() + " header " + "\n"
      @header = ""
    else
      @header = $1
    end
    # フッターを取り出す。
    #@footer.scan(/<footer.*?>(*)<\/footer>/m)
    #@footer = $1

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

    @html = @doctype + @header + @body + @footer
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

    html = @doctype + @header + @body + @footer
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
    return @dir.sub("./Config/template/", "")
  end

  def get_title()
    title = File.open(@dir + "/title.txt", 'r:utf-8').read
    return title
  end

  def get_description()
    description = File.open(@dir + "/description.txt", 'r:utf-8').read
    return description
  end

  def get_index()
    index = File.open(@dir + "/index.html", 'r:utf-8').read
    index.scan(/<body.*?>(.*?)<\/body>/m)
    index = $1
    return index
  end
end

# ディレクトリ一覧取得
pages = []
Dir.glob('./Config/template/*').each{|dir|
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
