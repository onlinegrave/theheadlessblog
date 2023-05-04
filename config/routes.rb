POSTS_PATH = Rails.root+"posts/**/*.md"

ids = []
Dir[POSTS_PATH].each do |subpath|
  ids << File.basename(subpath).gsub(/\.md$/, "")
end

Rails.application.routes.draw do
  root "posts#index"
  ids.each do |id|
    get id, to: "posts#show"
  end
end
