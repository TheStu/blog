atom_feed :language => 'en-US' do |feed|
  feed.title "XXX Posts"
  feed.updated Post.maximum('created_at')
  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.content post.content, type: 'html'
      entry.author do |author|
        author.name post.user.name
      end
    end
  end
end
