# $ show views
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Showing the contents of app/views
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  /accounts
#    - index.html.erb
#  /home
#    - file.html.erb
#    /whatever
#      - stuff.html.erb
#
#
#
require 'colorize'

namespace :ls do
  def announce(type)
    puts '~' * 40
    puts "Showing files within app/#{type}"
    puts '~' * 40 and puts
  end

  def delimit_block(level)
    puts if level == 0
  end

  def print_line(level, item, color)
    puts "#{'  ' * level}#{item}".colorize(color)
  end

  def print_line_for_dir(dir, parent)
    dir.gsub(/(#{parent}?\/)/, '')
  end

  def print_line_for_file(file, dir)
    file.gsub("#{dir}/", '')
  end

  def print_dir_recursive(parent, level=0)
    Dir["#{parent}/*/"].each do |dir|
      delimit_block(level)
      print_line(level, print_line_for_dir(dir, parent), :green)

      Dir["#{dir}/*rb"].each do |file|
        print_line(level + 1, print_line_for_file(file, dir), :cyan)
      end

      print_dir_recursive(dir, level + 1)
    end
  end



  # task :models do
  #   print_dir_recursive('app/models')
  #   puts
  # end

  task :views do
    print_dir_recursive('app/views')
    puts
  end

  # task :controllers do
  #   print_dir_recursive('app/controllers')
  #   puts
  # end



  # task :m do
  #   announce('models')
  #   Rake::Task['ls:models'].invoke
  # end

  task :v do
    announce('views')
    Rake::Task['ls:views'].invoke
  end

  # task :c do
  #   announce('controllers')
  #   Rake::Task['ls:controllers'].invoke
  # end



  # task :mvc do
  #   Rake::Task['ls:m'].invoke
  #   Rake::Task['ls:v'].invoke
  #   Rake::Task['ls:c'].invoke
  # end
end