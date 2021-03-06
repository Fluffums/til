def pretty_file_name(name)
  name.gsub('-', ' ').split.map(&:capitalize).join(' ')
end

def header
<<STRING
[This Post](https://github.com/jbranchaud/til) motivated me to start keeping track of small technology related things I learn.\n
STRING
end

subjects = Dir.glob('*').select { |f| File.directory? f }

sub_file_hash = subjects.each_with_object({}) do |sub, hsh|
  hsh[sub] = Dir.entries(sub).select { |f| !File.directory? f }
end

readme = File.open('README.md', 'w+')
readme.write("# TIL \n")
readme.write("> Today I Learned \n")
readme.write("\n")
readme.write(header)
readme.write("### Categories\n")
subjects.each { |s| readme.write "- [#{s.capitalize}](##{s})\n"}
readme.write("\n")

sub_file_hash.each do |sub, files|
  readme.write "\n"
  readme.write "--- \n"
  readme.write "### #{sub.capitalize}\n"
  files.each {|f| readme.write "- [#{pretty_file_name(f)}](#{sub}/#{f})\n"}
end

readme.close

