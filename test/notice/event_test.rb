require 'test_helper'

module Notice

  describe Event do
    it 'can returns the event in text format' do
      Event.new(:like, 'likes').to_s.must_equal 'likes'
    end
  end
end
