# script/rename_wedding_images.rb
require 'fileutils'

# Adjust this if your images are stored somewhere else
folder = Rails.root.join("app", "assets", "images", "wedding")

files = Dir.children(folder).select { |f| File.file?(File.join(folder, f)) }

files.each_with_index do |file, index|
  ext = File.extname(file).downcase # keep original extension (.jpg, .png, etc.)
  new_name = "#{index + 1}#{ext}"
  old_path = File.join(folder, file)
  new_path = File.join(folder, new_name)

  FileUtils.mv(old_path, new_path)
  puts "Renamed #{file} -> #{new_name}"
end
