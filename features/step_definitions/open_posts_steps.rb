Given(/^a valid dotfile exists$/) do
  file_content = <<-eos
  :blog_location: /home/lorentrogers/journal
  eos
  write_file("~/.jekylljournal.yaml", file_content)
end

Given(/^the blog post for (today|yesterday) (does|does not) exist$/) do |day, exists|
  format = '%Y-%m-%d'
  date = day == 'today' ? Date.today.strftime(format) : Date.today.prev_day.strftime(format)
  file_name = "/home/lorentrogers/journal/_posts/#{date}-#{date}.md"

  if exists == 'does'
    write_file(file_name, 'dummy content')
  else
    remove(file_name, :force => true)
  end
end

Then(/^it (should|should not) (create|open) the post for (today|yesterday)$/) do |should, action, day|
  format = '%Y-%m-%d'
  date = day == 'today' ? Date.today.strftime(format) : Date.today.prev_day.strftime(format)
  file_name = "/home/lorentrogers/journal/_posts/#{date}-#{date}.md"

  if action == 'create'
    write_file(file_name, 'dummy content')
  else
    pending
  end
end
