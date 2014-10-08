require 'rake'

DIR_MAPPING = {
  "#{Dir.pwd}/vim" => "#{ENV['HOME']}/.vim",
  "#{Dir.pwd}/omzsh-custom" => "#{ENV['HOME']}/.oh-my-zsh/custom"
}

task install: [
  :git_sub_init,
  :git_sub_update,
  :link_dir,
  :link_file
]

desc "Link the dot files into user's home directory"
task :link_file do
  files = Dir.glob("**/*.symlink")
  files.each do |file|
    link_file(file)
  end
end

desc "Link directories into it's specified location"
task :link_dir do
  DIR_MAPPING.each do |src, dest|
    link_dir(src, dest)
  end
end

desc "Init git submodules"
task :git_sub_init do
  system %Q{git submodule init}
end

desc "Update all git submodules recursively"
task :git_sub_update do
  system %Q{git submodule update --init --recursive}
end

desc "Update all dotfiles and submodules"
task :update do
  system %Q{git pull --recurse-submodules}
end
def backup_file file
  return unless File.exists?(file)
  if File.symlink?("#{ENV['HOME']}/.#{file}" )
    puts "relinking .#{file}"
  else
    puts "backing up .#{file} to .#{file}.backup"
    system %Q{mv -f "$HOME/.#{file}" "$HOME/.#{file}.backup"}
  end
end

def link_file(file)
  link_name = file.split("/").last
  link_name.slice! ".symlink"
  backup_file link_name
  puts "linking ~/.#{link_name}"
  system %Q{ln -sf "$PWD/#{file}" "#{ENV['HOME']}/.#{link_name}"}
end

def link_dir(src, dest)
  if File.symlink?(src)
    puts "relinking .#{file}"
    system %Q{ln -sf #{src} "#{dest}"}
  else
    puts "backing up #{dest} to .#{dest}.backup"
    system %Q{mv -f  "#{dest}" "#{dest}.backup"}
  end
  puts "linking #{src} to #{dest}"
  system %Q{ln -sf "#{src}" "#{dest}"}
end
