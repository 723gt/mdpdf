require 'redcarpet'
require 'PDFKit'

module Mdpdf
  class Md2Pdf
    def initialize(mdfile_name,outfile_name = nil)
      @mdfile_name = mdfile_name
      @outfile_name = outfile_name
      file_read
    end

    def file_read
      html_body = String.new
      File.open(@mdfile_name) do|file|
        file.read.split("\n").each do |c|
          html_body += c + "\n"
        end
      end
      creat_md(html_body)
    end

    def creat_md(html_body)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :tables => true, :autolink => true,:fenced_code_blocks => true) 
      body = markdown.render(html_body) 
      html_template = "
        <!DOCTYPE html>
        <html>
          <head>
            <meta charset='UTF-8'>
            <title>#{@outfile_name}</title>
          </head>
          <body>
            #{body}
          </body>
        </html>
      "
      create_pdf(html_template)
    end

    def create_pdf(html)
      file = open("./#{@outfile_name}.pdf","w")
      file.puts PDFKit.new(html,encoding: "UTF-8").to_pdf
      file.close
    end

  end
end

