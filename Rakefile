require 'rake'

DIR_MAPPING = {
  "#{Dir.pwd}/vim" => "#{ENV['HOME']}/.vim",
  "#{Dir.pwd}/tmuxinator" => "#{ENV['HOME']}/.tmuxinator",
  "#{Dir.pwd}/omzsh-custom" => "#{ENV['HOME']}/.oh-my-zsh/custom"
}

task install: [
  :git_sub_init,
  :git_sub_update,
  :link_directories,
  :link_files
]

desc "Link the dot files into user's home directory"
task :link_files do
  files = Dir.glob('**/*.symlink')
  files.each do |file|
    link_file(file)
  end
end

desc "Link directories into it's specified location"
task :link_directories do
  DIR_MAPPING.each do |src, dest|
    link_dir(src, dest)
  end
end

desc 'Init git submodules'
task :git_sub_init do
  system %( git submodule init )
end

desc 'Update all git submodules recursively'
task :git_sub_update do
  system %( git submodule update --init --recursive )
end

desc 'Update all dotfiles and submodules'
task :update do
  system %( git pull --recurse-submodules )
end

def backup_file(file)
  return unless File.exist?(file)
  if File.symlink?("#{ENV['HOME']}/.#{file}")
    puts "relinking .#{file}"
  else
    puts "backing up .#{file} to .#{file}.backup"
    system %( mv -f "$HOME/.#{file}" "$HOME/.#{file}.backup" )
  end
end

def link_file(file)
  link_name = file.split('/').last
  link_name.slice! '.symlink'
  backup_file link_name
  puts "linking ~/.#{link_name}"
  system %( ln -sf "$PWD/#{file}" "#{ENV['HOME']}/.#{link_name}" )
end

def link_dir(src, dest)
  if File.exist?(dest) && !File.symlink?(dest)
    puts "backing up #{dest} to .#{dest}.backup"
    system %( mv -f  "#{dest}" "#{dest}.backup" )
  end
  puts "linking #{src} to #{dest}"
  system %( rm -rf "#{dest}" )
  system %( ln -sf "#{src}" "#{dest}" )
end
