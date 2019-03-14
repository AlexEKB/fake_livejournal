desc 'Counter cache for post has many comments'

task comment_counter: :environment do
  Post.reset_column_information
  Post.find_each { |p| Post.reset_counters(p.id, :comments)}
end
