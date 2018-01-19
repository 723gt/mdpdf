require 'redcarpet'
require 'PDFKit'

module Mdpdf
  class Md2Pdf
    def initialize(mdfile_name,outfile_name = nil)
      @mdfile_name = mdfile_name
      @outfile_name = outfile_name
    end

    def file_read
      html_body = String.new
      File.open(@mdfile_name) do|file|
        file.read.split("\n").each do |c|
          html_body += c + "\n"
        end
      end
    end

    def creat_md(html_body)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :tables => true, :autolink => true) 
      body = markdown.render(html_body) 
      html_template = "
        <!DOCTYP html>
        <html>
          <head>
            <meta charset='UTF-8'>
            <title>#{@outfile_name}</title>
            <link rel='stylesheet' type='text/css' href='github.css'>
          </head>
          <body>
            #{body}
          </body>
        </html>
      "
    end

    def create_pdf(html)
      file = open("#{@outfile_name}.pdf","w")
      file.puts PDFKit.new(html,encoding: "UTF-8").to_pdf
      file.close
    end

  end
end

