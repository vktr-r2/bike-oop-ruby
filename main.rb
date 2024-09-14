class Gear
    attr_reader :chainring, :cog, :wheel
    
    def initialize(chainring, cog, wheel=nil)
        @chainring = chainring
        @cog = cog
        @wheel = wheel
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * wheel.diameter
    end
end

class Wheel
    
    attr_reader :rim, :tire

    def initialize(rim, tire)
        @rim = rim
        @tire = tire
    end

    def diameter
        rim + (tire * 2)
    end

    def circumference
        diameter * Math::PI 
    end
end

=begin
puts Gear.new(52, 11, 26, 1.5).ratio # 4.7272727272727275
puts Gear.new(30, 27, 24, 1.25).ratio # 1.1111111111111112
puts Gear.new(52, 11, 26, 1.5).gear_inches # 137.0909090909091
puts Gear.new(30, 27, 24, 1.25).gear_inches # 125.27272727272728
=end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference

puts Gear.new(52, 11, @wheel).gear_inches

puts Gear.new(52, 11).ratio

