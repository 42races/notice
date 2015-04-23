require 'test_helper'

module Notice

  describe Event do

    it 'has no registered events by default' do
      Event.registered_events.must_equal ({})
    end

    it 'can register events' do
      Event.register_event(:like, 'likes')
      Event.registered_events.size.must_equal 1
    end

    it 'can returns the event in text format' do
      Event.new(:like, 'likes').to_s.must_equal 'likes'
    end
  end
end
