@input = File.readlines('third_input.txt')


def part_one
    ones = Array.new(12) { 0 }
    zeroes = Array.new(12) { 0 }
    
    @input.each do |binary_string|
        idx = 0
        binary_string.chomp.chars.each do |digit|
            if digit == '1'
                ones[idx] += 1
            else
                #puts idx
                zeroes[idx] += 1
            end
            idx += 1
        end
    end
    
    gamma_rate = ""
    epsilon_rate = ""   
    
    for i in 0..11 do
        if ones[i] > zeroes[i]
            gamma_rate << '1'
            epsilon_rate << '0'
        else
            gamma_rate << '0'
           # epsilon_rate << '1'   
        end
    end

    return 0
end

def part_two
    common_bits = Array.new(12) { 0 }
    @input.each do |binary_string|
        idx = 0
        binary_string.chomp.chars.each do |bit|
            if bit == '1'
                common_bits[idx] += 1
            end
            idx += 1
        end
    end
    
    o2_generator_rating = []
    o2_generator_rating.replace(@input)
    co2_generator_rating = []
    co2_generator_rating.replace(@input)
    for i in 0..11 do
        if o2_generator_rating.size == 1
            break
        end

        if common_bits[i] > @input.size / 2
            o2_generator_rating.reject! { |n| n.chars[i] == '0'}
        else
            o2_generator_rating.reject! { |n| n.chars[i] == '1'}
        end
    end

    for i in 0..11 do
        if co2_generator_rating.size == 1
            break
        end

        if common_bits[i] > @input.size / 2
            co2_generator_rating.reject! { |n| n.chars[i] == '1'}
        else
            co2_generator_rating.reject! { |n| n.chars[i] == '0'}
        end
    end

    puts o2_generator_rating
    puts co2_generator_rating

end


part_two