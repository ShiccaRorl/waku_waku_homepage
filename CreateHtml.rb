# -*- encoding: utf-8 -*-

require "erb"
require "./Config/Config"


class CreateHtml
  attr_accessor :keyword, :css_theme_path, :link, :hiduke, :day, :title, :config, :page, :page_max, :changelogmemo, :calendar
  def initialize(page)
    @config = Config.new()
    @page = page

    @header          = File.open("./Config/template/header.erb", 'r:utf-8').read
    @footer          = File.open("./Config/template/footer.erb", 'r:utf-8').read
    @body            = File.open("./Config/template/body.erb", 'r:utf-8').read
    @autoupload_lftp = File.open("./Config/autoupload.lftp", 'r:utf-8').read

    # bodyだけを取り出す。
    #@body = @body.scan(/<body>*<\/body>/m)[0]



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

    @html = @header + @body + @footer
    #p changelogmemo

    erb = ERB.new(@html)

    @html = erb.result(binding)

    begin
      File.write("./www/" + @page.get_dir_name + "/" + "index.html", @html)
    rescue
      print "書き込みエラー\n"
    end

  end

  def create_body_index()
    # くっつける
    header = @header.gsub("./../image", "./image")
    body = @body.gsub("./../image", "./image")
    footer = @footer.gsub("./../image", "./image")

    @html = header + body + footer
    #p changelogmemo

    erb = ERB.new(@html)

    @html = erb.result(binding)

    begin
      File.write("./www/" + "index.html", @html)
    rescue
      print "書き込みエラー\n"
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
    title = File.open("./Config/template/" + self.get_dir_name + "/title.txt", 'r:utf-8').read
    return title
  end

  def get_description()
    description = File.open("./Config/template/" + self.get_dir_name + "/description.txt", 'r:utf-8').read
    return description
  end

  def get_manuscript()
    manuscript = File.open("./Config/template/" + self.get_dir_name + "/manuscript.html", 'r:utf-8').read
    return manuscript
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

i = []
pages.each{|page|
  if page.get_dir_name() != "image" then
    i << page.get_dir_name()
  end
}
pages = i

=begin
# wwwの既存のデリク取り一覧取得
temp_pages = []
Dir.glob('./www/*').each{|dir|
unless Dir.exist?(dir) then
#print dir
else
temp_pages << Page.new(dir)
end
}

pages = pages. - temp_pages

# 新しく追加したディレクトリ作成
pages.each{|page|
if Dir.exist?(page.get_dir_name()) then

else
Dir.mkdir("./www/" + page.get_dir_name())
end
}
=end

# HP作成
pages.each{|page|
  create_html = CreateHtml.new(page)
  create_html.create_body_index()
  create_html.create_body()
}
