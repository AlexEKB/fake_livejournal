desc 'Generate slugs for existing users'

task friendly_id: :environment do
  Post.find_each(&:save)
end
