# This class is used to handle Jekyll Journals.
# It is generally called from the command line wrapper.
class Journalhandler

  # Loads the config dotfile from the default directory and sets the
  # application options
  def initialize
    @options = { }

    config_file = File.join(ENV['HOME'],'.jekylljournal.yaml')
    if File.exists? config_file
      config_options = YAML.load_file(config_file)
      if !config_options
        puts 'Config file empty, please see the readme.'
      else
        @options.merge!(config_options)
      end
    else
      puts 'Config file not found, please create one.'
    end
  end

  # Opens today's post if it exists, otherwise
  # it creates a new post, populates it with
  # the default yaml frontmatter, then opens
  # this newly created file.
  def open
    today = Date.today.strftime '%Y-%m-%d'
    file_name = "#{@options[:blog_location]}/_posts/#{today}-#{today}.md"
    # create the file if it doesn't exist
    frontmatter = <<eol
---
layout: post
title: #{today}
---

eol

    File.write file_name, frontmatter unless File.file? file_name

    puts "Opening #{file_name}"
    system 'vim', file_name
  end

  # Adds and commits all new posts and assets to git, then
  # pushes to the default repositories.
  # TODO
  def save
    puts 'Saving...'
    run_git_cmd 'add _posts/*'
    run_git_cmd 'add assets/*'
    # TODO: this should use more flexible values.
    # Date format should be a dotfile option
    # Message format should be a dotfile option
    run_git_cmd "commit -m \"Save: #{Date.today.strftime '%Y-%m-%d'}\""
    run_git_cmd 'push'
    puts 'done.'
  end

  private

  def run_git_cmd cmd
    location = @options[:blog_location]
    `git --git-dir=#{location}/.git --work-tree=#{location} #{cmd}`
  end
end
