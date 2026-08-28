class DoomController < ApplicationController
  def index
    render html: <<~HTML.html_safe
      <!DOCTYPE html>
      <html>
        <head>
          <title>DOOM</title>
          <style>
            html, body { margin: 0; height: 100%; background: #000; }
            iframe { width: 100%; height: 100%; border: 0; }
          </style>
        </head>
        <body>
          <iframe src="https://archive.org/embed/msdos_DOOM_1993" allowfullscreen></iframe>
        </body>
      </html>
    HTML
  end
end
