@moves = File.readlines('second_input.txt')

def part_one
    horizontal = 0
    depth = 0
    @moves.each do |m|
        magnitude = m.split()[1].to_i
        if m.include? 'forward'
            horizontal += magnitude
        elsif m.include? 'down'
            depth += magnitude
        elsif m.include? 'up'
            depth -= magnitude
        end
    end
    return (horizontal * depth).to_s
end

def part_two
    horizontal = 0
    depth = 0
    aim = 0
    @moves.each do |m|
        magnitude = m.split()[1].to_i
        if m.include? 'forward'
            horizontal += magnitude
            depth += aim * magnitude
        elsif m.include? 'down'
            aim += magnitude
        elsif m.include? 'up'
            aim -= magnitude
        end
    end
    return (horizontal * depth).to_s
end

puts part_one
puts part_two
