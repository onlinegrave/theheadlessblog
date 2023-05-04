require 'github/markup'

class PostsController < ApplicationController
  def index
    @posts = []
    Dir[POSTS_PATH].each do |subpath|
      data = File.read(subpath)
      part1 = []
      postData = ""
      c= 0
      data.split.each_with_index do |token, index|
        if ["---"].include? token
          c += 1
        else
          part1 << token
        end
        break if c > 1
      end

      date = ""
      title = []
      isTitle = false
      part1.each_with_index do |token, index|
        title << token if isTitle
        isTitle = false if isTitle && token.match?(/('|\")$/)
        isTitle = true if ["title:"].include? token
        date = part1[index+1].gsub(/^('|\")|('|\")$/, "") if ["date:"].include? token
      end
      @posts << { id: File.basename(subpath).gsub(/\.md$/, ""), title: title, date: date }.with_indifferent_access
    end
  end

  def show
    filename = request.url.split('/')[request.url.split('/').length-1]
    File.read(File.join(Rails.root+"posts/#{filename}.md"))
    data = File.read(File.join(Rails.root+"posts/#{filename}.md"))
    part1 = []
    postData = ""
    c= 0
    characters_to_skip = 0
    data.split.each_with_index do |token, index|
      if ["---"].include? token
        c += 1
      else
        part1 << token
      end
      characters_to_skip += token.length+1 # 1 is for space
      break if c > 1
    end
    postData = data[characters_to_skip..data.length]

    @date = ""
    @title = []
    isTitle = false
    part1.each_with_index do |token, index|
      @title << token if isTitle
      isTitle = false if isTitle && token.match?(/('|\")$/)
      isTitle = true if ["title:"].include? token
      @date = part1[index+1].gsub(/^('|\")|('|\")$/, "") if ["date:"].include? token
    end

    @title = @title.join(' ').gsub(/^('|\")|('|\")$/, "")
    @keywords=[]
    @content = GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, postData)
  end
end


# [/#{Regexp.escape(marker1)}(.+)#{Regexp.escape(marker2)}/m, 1]
