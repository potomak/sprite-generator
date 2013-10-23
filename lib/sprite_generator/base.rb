module SpriteGenerator
  class Base
    def initialize(width, height, frames)
      @width = width.to_i
      @height = height.to_i
      @frames = frames.to_i
    end

    def pixels
      @height.times.map do |i|
        (@width*@frames).times.map do |j|
          h = (j / @width).floor * (360.0 / @frames)
          rgb_array(Color::HSL.new(h, 100, 50))
        end
      end
    end

    def rgb_array(hsl_color)
      rgb = hsl_color.to_rgb
      ['r', 'g', 'b'].map do |component|
        (rgb.send(component) * Magick::QuantumRange).to_i
      end
    end

    def image
      Magick::Image.constitute(@width*@frames, @height, 'RGB', pixels.flatten)
    end

    def save_as(filename)
      File.open(filename, 'w') do |f|
        f.write(image.to_blob {|i| i.format = 'png'})
      end
    end
  end
end