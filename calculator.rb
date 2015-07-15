require 'colorize'
include Math

startscreen =  "
                                   +--------------------------------------------------+
                                   |           "+"   Fake I - 84 Calculator   ".green+"           |
+----------------------------+     +--------------------------------------------------+      +----------------------------+ 
|      Basic Operations      |                                                               |     Special Operations     |
+----------------------------+----------------------------+     +----------------------------+----------------------------+
|  *  |  Multiplication      |  /  |  Division            |     | sin | sin function (sinAA) | cos | cosine function      |
+----------------------------+----------------------------+     +----------------------------+----------------------------+
|  +  |  Addition            |  -  |  Subtraction         |     |quad | Quadratic formula    |pyth | Pythagorean Theorem  |
+----------------------------+----------------------------+     +----------------------------+----------------------------+
|  ** |  Power (exponent)    |  %  |  Mod                 |     |"+" ===>       [Number 1] [operation] [Number2]       <=== ".yellow+" |
+----------------------------+----------------------------+     +----------------------------+----------------------------+


===========================================================
[         Input your calculations and press ENTER         ]
===========================================================
>> Calculation?"+" [Type in 'end' and press ENTER to end]".red

def factorial(num)
  x = 1
  while  num > 0
    x = x * (num)
    num -= 1
  end
  return x
end

def quad
  puts "|   Quadratic Formula   |".yellow
  puts "What is A?"
  a = gets.chomp.to_f
  puts "What is B?"
  b = gets.chomp.to_f
  puts "What is C?"
  c = gets.chomp.to_f
  ans1 = ((0-b)+((b**2)-(4*a*c))**0.5)/(2*a)
  ans2 = ((0-b)-((b**2)-(4*a*c))**0.5)/(2*a)
  return "The two roots of the equation #{a}x^2 + #{b}x + #{c} are\nx1 = #{ans1}\nx2 = #{ans2}:"
end

def pyth
  puts "|   Pythagorean Theorem   |".yellow
  puts "What is the first side?"
  side1 = gets.chomp.to_f
  puts "What is the second side?"
  side2 = gets.chomp.to_f
  puts "Are you missing a hypothenuse or a leg? (h or l)"
  missing = gets.chomp
  if missing == "h"
    return ((side1**2) + (side2**2))**0.5
  elsif (missing == "l") && (side1 > side2)
    return ((side1**2) - (side2**2))**0.5
  elsif (missing == "l") && !(side2 < side1)
    return ((side2**2) - (side1**1))**0.5
  else 
    return "Invalid inputs"
  end
end

def sine(deg)
  rad = (deg * 3.14159) / 180
  return sin(rad)
end

def compute(calc)
  if calc.include? "**"
    return (calc[0..calc.index("**")].to_f)**(calc[calc.index("**")+2..-1].to_f)
  elsif calc.include? "%"
    return (calc[0..calc.index("%")].to_f)%(calc[calc.index("%")+1..-1].to_f)
  elsif calc.include? "*"
    return (calc[0..calc.index("*")].to_f)*(calc[calc.index("*")+1..-1].to_f)
  elsif calc.include? "/"
    return (calc[0..calc.index("/")].to_f)/(calc[calc.index("/")+1..-1].to_f)
  elsif calc.include? "+"
    return (calc[0..calc.index("+")].to_f)+(calc[calc.index("+")+1..-1].to_f)
  elsif calc.include? "-"
    return (calc[0..calc.index("-")].to_f)-(calc[calc.index("-")+1..-1].to_f)
  elsif calc.include? "!"
    return factorial(calc[0..calc.index("!")].to_f)
  elsif calc.include? "quad"
    return quad
  elsif calc.include? "pyth"
    return pyth
  elsif calc.include? "sin"
    return sine(calc[3..-1].to_f)
  end
end

def startoff(calculation)
  if calculation != "end"
    ans = compute(calculation)
    puts ">> #{ans.to_s}".green
    puts ">> Next calculation?"+" [Type in 'end' and press ENTER to end]".red
    another = gets.chomp
    startoff(another)
  else puts "
+----------------------------+----------------------------+     +----------------------------+----------------------------+
+----------------------------+----------------------------+     +----------------------------+----------------------------+
"
  end
end

system "clear"
puts startscreen
calc = gets.chomp
startoff(calc)
