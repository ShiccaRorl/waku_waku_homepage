# -*- encoding: utf-8 -*-

require "erb"
require "./Config/config.rb"


  class CreateHtml
    attr_accessor :keyword, :css_theme_path, :link, :hiduke, :day, :title, :config, :page, :page_max, :changelogmemo, :calendar
    def initialize()
      @config = Config.new()

      @header          = File.open("./template/header.erb", 'r:utf-8').read
      @footer          = File.open("./template/footer.erb", 'r:utf-8').read
      @body            = File.open("./template/body.erb", 'r:utf-8').read
      @autoupload_lftp = File.open("./autoupload.lftp", 'r:utf-8').read

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

    def create_body_public()
      # くっつける

      @page.each{|page, file_name, changelogmemo|
        print "page " + page.to_s + " 作成中\n"
        #p file_name
        @changelogmemo = changelogmemo

        @html = @header + @body + @footer
        #p changelogmemo

        erb = ERB.new(@html)

        @html = erb.result(binding)

        begin
          File.write(@config.www_html_out_path + file_name, @html)
        rescue
          print "書き込みエラー\n"
        end
      }
    end


    def lftp()
      erb = ERB.new(@autoupload_lftp)
      lftp = erb.result(binding)

      begin
        File.write("./CharuConfig/autoupload.lftp", lftp)
      rescue
        print "書き込みエラー\n"
      end
    end

  end

