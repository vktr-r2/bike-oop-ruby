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
        ratio * diameter
    end

    def diameter
        wheel.diameter
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

wheel = Wheel.new(26, 1.5)
puts wheel.circumference

puts Gear.new(52, 11, wheel).gear_inches

puts Gear.new(52, 11).ratio
puts Gear.new(52, 11).ratio



# CHAPTER 6: Aquiring Behaviour Through Inheritance

class Bicycle
    attr_reader :size, :chain, :tire_size

    def initialize(args={})
        @size           = args[:size]
        @chain          = args[:chain]      || default_chain
        @tire_size      = args[:tire_size]  || default_tire_size
        post_initialize(args)

    end

    def spares
        { tire_size: tire_size,
        chain: chain}.merge(local_spares)
    end

    def default_tire_size
        raise NotImplementedError
    end

    def post_initialize(args)
        nil
    end

    def local_spares
        {}
    end

    def default_chain
        "10-speed"
    end

end

class RoadBike < Bicycle
    attr_reader :tape_colour

    def post_initialize(args)
        @tape_colour = args[:tape_colour]
    end

    def local_spares
        {tape_colour: tape_colour}
    end

    def default_tire_size
        "23"
    end
end