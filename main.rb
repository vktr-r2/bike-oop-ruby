class Gear
    attr_reader :chainring, :cog, :rim, :tire
    
    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog = cog
        @rim = rim
        @tire = tire
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * (rim + (tire * 2))
    end
end

puts Gear.new(52, 11, 26, 1.5).ratio # 4.7272727272727275
puts Gear.new(30, 27, 24, 1.25).ratio # 1.1111111111111112
puts Gear.new(52, 11, 26, 1.5).gear_inches # 137.0909090909091
puts Gear.new(30, 27, 24, 1.25).gear_inches # 125.27272727272728