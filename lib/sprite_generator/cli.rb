require 'thor'

module SpriteGenerator
  class CLI < ::Thor
    desc "generate FILE", "Generate a sprite"
    method_option :width, :required => true, :aliases => "-w", :desc => "Width of sprite frames"
    method_option :height, :required => true, :aliases => "-h", :desc => "Height of sprite frames"
    method_option :frames, :required => true, :aliases => "-f", :desc => "Number of frames"
    def generate(file)
      puts "Generating sprite: #{file}"
      sprite_generator = SpriteGenerator::Base.new options[:width], options[:height], options[:frames]
      sprite_generator.save_as(file)
    end
  end
end