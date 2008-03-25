#Name: Movie
#Author: Kai Kousa
#Description: Movie is a wrapper class to hold audio- and videosequences
#that compose a movie.
require 'model/audio_sequence'
require 'model/visual_sequence'
require 'project'

class Movie
  
  attr_reader(:name, :format, :resolution, :audioSequence, :visualSequence, :effects, :project, :width, :height)
  
  def initialize(name, format, resolution)
    @name = name
    @format = format
    @resolution = resolution
    @audioSequence = AudioSequence.new
    @visualSequence = VisualSequence.new
    @effects = []
    @project = Project.new(@name)
    setWidthAndHeight(@resolution)
  end
  
  def visualSequence=(visualSequence)
    @visualSequence = visualSequence
  end
  
  def audioSequence=(audioSequence)
    @audioSequence = audioSequence
  end
  
  def effects=(effects)
    @effects = effects
  end
  
  def audioLongerThanVideo?()
    sortedVisuals = @visualSequence.sort
    
    sortedAudios = @audioSequence.sort
    lastAudio = sortedAudios[sortedAudios.length - 1]
    lastVisual = sortedVisuals[sortedVisuals.length - 1]
    if (lastAudio.place.milliseconds + lastAudio.length) > (lastVisual.place.milliseconds + lastVisual.length)
      return true
    else
      return false
    end
  end
  
  def to_str()
    "\nName: #{@name}\nFormat: #{@format}\nResolution: #{@resolution}\n\n"
  end
  
  def setWidthAndHeight(resolution)
      widthAndHeight = resolution.split('x')
      @width = widthAndHeight[0]
      @height = widthAndHeight[1]
  end
  private :setWidthAndHeight
end
