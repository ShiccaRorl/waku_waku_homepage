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

    #@body = @body.scan(/<body>.*?<\/body>/)



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
p @body

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
    @dir.delete("image")
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

pages = []
Dir.glob('./Config/template/*').each{|dir|
  unless Dir.exist?(dir) then
    #print dir
  else
    pages << Page.new(dir)
  end
}

pages.each{|page|
  create_html = CreateHtml.new(page)
  create_html.create_body_index()
  create_html.create_body()
}
