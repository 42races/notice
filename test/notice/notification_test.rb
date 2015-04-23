require 'test_helper'

module Notice

  describe Notification do

    let(:default_options) {
      {
        type: 'default'
      }
    }

    it 'creates a new notification' do
      assert Notification.new('')
    end

    it 'accepts a messgage and options' do
      assert Notification.new('message', {})
    end

    it 'has a set of default options' do
      n = Notification.new('')
      n.options.must_equal default_options
    end

    it 'has a set of valid options' do
      # update on adding a new option
      options = [:type, :event, :actor]
      Notification::VALID_OPTIONS.keys.must_equal options
    end

    it 'has a set of valid types of notifications' do
      types = %w(default success info warning danger)
      Notification::VALID_OPTIONS[:type].must_equal types
    end

    it 'accepts valid options vith possible value' do
      n = Notification.new('', type: 'info')
      n.options.must_equal default_options.merge({ type: 'info'})
    end

    it 'ignores invalid options' do
      n = Notification.new('', invalid: true)
      n.options.must_equal default_options
    end

    it 'ignores invalid valued options' do
      n = Notification.new('', type: 'unknown')
      n.options.must_equal default_options
    end

    it 'ignores invalid valued options' do
      n = Notification.new('', event: 'Follow')
      n.options.must_equal default_options.merge({ event: 'Follow'})
    end

    it 'ignores blank valued options' do
      n = Notification.new('', event: '')
      n.options.must_equal default_options
    end
  end
end
