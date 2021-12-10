def part_one
    first_line = true
    prev = nil
    res = 0
    File.readlines('first_input.txt').each do |line|
        cur = line.to_i
    
        if first_line
            first_line = false
            prev = cur
        else
            if prev < cur
                res += 1
            end
            prev = cur
        end
    end
    
    return res
end

def part_two
    res = 0
    nums = File.readlines('first_input.txt')
    window = nums[..2].map(&:to_i)
    prev = window.sum

    for i in 0..nums.length do
        window = window[1..]
        window << nums[i]

        if prev < window.map(&:to_i).sum 
            res += 1
        end
        prev = window.map(&:to_i).sum
    end
    return res
end

puts "Part one: #{part_one}"
puts "Part two: #{part_two}"
