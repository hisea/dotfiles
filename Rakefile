require 'rake'

desc "install the dot files into user's home directory"
task :install do
  files = Dir['*.symlink']
  files.each do |file|
    link_file(file)
  end
end

def backup_file file
  if File.symlink?("#{ENV['HOME']}/.#{file}" )
    puts "relinking .#{file}"
  else
    puts "backing up .#{file} to .#{file}.backup"
    system %Q{mv -f "$HOME/.#{file}" "$HOME/.#{file}.backup"}
  end
end

def link_file(file)
  link_name = file.dup
  link_name.slice! ".symlink"
  backup_file link_name
  puts "linking ~/.#{link_name}"
  system %Q{ln -sf "$PWD/#{file}" "#{ENV['HOME']}/.#{link_name}"}
end
