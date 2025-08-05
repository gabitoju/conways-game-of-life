require_relative 'life'

DEFAULT_HEIGHT = 30
DEFAULT_WIDTH = 30
DEFAULT_DENSITY = 0.25

def clean_screen
  system('clear') || system('cls')
end

title = <<~TITLE


  ██      ██ ███████ ███████#{' '}
  ██      ██ ██      ██#{'      '}
  ██      ██ █████   █████#{'   '}
  ██      ██ ██      ██#{'      '}
  ███████ ██ ██      ███████#{' '}
  #{'                           '}
  #{'                           '}


TITLE

clean_screen
puts title

puts 'Hello, welcome to the game of life'
puts 'Please, choose wich kind of world you want'
puts 'D - default'
puts 'G - glider'
puts 'R - random'
world = gets.chomp.strip.downcase

puts 'Now enter the generation delay in seconds'
delay = gets.chomp.strip.to_f

life = if world == 'd'
         Life.new(DEFAULT_HEIGHT, DEFAULT_WIDTH, [[15, 15], [15, 14], [14, 15], [16, 15], [16, 16]])
       elsif world == 'r'
         puts 'Enter density or blank for default (0.25)'
         density = gets.chomp.strip
         density = if density == ''
                     DEFAULT_DENSITY
                   else
                     density.to_f
                   end

         Life.random(DEFAULT_HEIGHT, DEFAULT_WIDTH, density)
       else
         Life.glider(DEFAULT_HEIGHT, DEFAULT_WIDTH)
       end

begin
  while true
    clean_screen
    puts "Generation #{life.generation}"
    puts "Population #{life.population}"
    life.show
    sleep delay
    break if life.population == 0

    life.do_the_evolution
  end
rescue Interrupt
  puts "\nGoodbye!"
end
