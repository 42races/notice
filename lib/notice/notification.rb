
module Notice
  class Notification

    # possible options and possible values
    # use nil to use any values while adding new option support
    VALID_OPTIONS = {
      type: %w(default success info warning danger),
      event: nil,
      actor: nil
    }

    attr_reader :options

    def initialize(message, options = {})
      @message = message
      @options = extract_options(options)
      @actor   = @options[:actor]
    end

    def to_s
      "#{@actor.name}"
    end

    private

    def default_options
      {
        type: 'default'
      }
    end

    def extract_options(options)
      invalid_keys = options.keys - VALID_OPTIONS.keys

      options.delete_if do |key|
        invalid_key?(invalid_keys, key) || invalid_valued_key?(key, options[key])
      end

      default_options.merge(options)
    end

    def invalid_key?(invalid_keys, key)
      invalid_keys.include?(key)
    end

    def invalid_valued_key?(key, val)
      return true if val.to_s.empty?
      values = VALID_OPTIONS[key]
      values && (!values.include?(val))
    end
  end
end
