require 'open-uri'

module SvobodniLayout
  class Processor

    attr_accessor :output

    def fetch
      self.external = open("http://web.svobodni.cz/external").read
    end

    def external=(source)
      @output = source
      @output.gsub!(/src="\//,'src="//web.svobodni.cz/')
      @output.gsub!(/href="\//,'href="//web.svobodni.cz/')
      @output.gsub!(/\<\% navigation.begin \%\>/, '')
      @output.gsub!(/\<\% navigation.end \%\>/, '')
      @output.gsub!(/\<\% content.begin \%\>\<\% content.end \%\>/, '<%= yield %>')
    end

    def title=(value)
      @output.gsub!(/\<title\>(.*?)\<\/title\>/, "<title>#{value}</title>")
      @output.gsub!(/\<\% title.begin \%\>Titulek\<\% title.end \%\>/, value)
    end

    def head=(value)
      @output.gsub!(/\<\/head\>/, "#{value}\n</head>")
    end

    def breadcrumb=(value)
      @output.gsub!(/\<ul class=\"breadcrumb\"\>(.*?)\<\/ul\>/m, "<ul class=\"breadcrumb\">#{value}</ul>")
    end

    def store(path=File.join(Rails.root,'/app/views/layouts/application.html.erb'))
      # FIXME: not using block because of test
      # File.open(path,'w') {|f| f << @output}
      file = File.open(path,'w')
      file.write(@output)
      file.close
    end

  end
end
