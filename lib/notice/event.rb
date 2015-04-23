# an event causes notification
class Event

  @event_list = {}

  attr_reader :name, :value

  def initialize(name, value)
    @name  = name
    @value = value
  end

  def to_s
    "#{@value}"
  end

  class << self
    def register_event(name, value)
      @event_list = @event_list.merge(name => Event.new(name, value))
    end

    def registered_events
      @event_list.freeze
    end
  end
end
