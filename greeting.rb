def greeting
  ARGV.each do |first_arg, *the_rest = ARGV|
    puts "#{first_arg} #{the_rest}"
end

greeting
