module Unchained
  class Client
    module Mixins

      # The Resource mixin gives you access to a DSL that lets you define what
      # the class should look like in the JSON response.
      #
      # Usage:
      #
      #   class Guild
      #     include Unchained::Client::Mixins::Resource
      #
      #     attribute :id, String
      #     attribute :name, String
      #     attribute :members, Integer, json: 'numberOfMembers'
      #   end
      #

      module Resource

        # An `Attribute` is what `attribute` creates.
        class Attribute
          attr_reader :name
          attr_reader :type
          attr_reader :opts

          def initialize(name, type, opts)
            @name = name
            @type = type
            @opts = opts
          end

          # The field that maps to this attribute in the JSON.
          #
          # Usage:
          #
          #   # json_field will return 'FOO'
          #   attribute :foo, json: 'FOO'
          #
          #   # json_field will return 'foo_bar'
          #   attribute :foo_bar
          #
          def json_field
            @opts.fetch(:json, @name.to_s)
          end

          # Whether or not to allow nil, defaults to false.
          def allow_nil?
            @opts.fetch(:allow_nil, false)
          end
        end

        def self.included(base)
          base.extend ClassMethods
        end

        # Mostly just a helper method that you can override if you
        # want to.
        def to_s
          attrs = self.class.attributes.map do |attr|
            "#{attr.name}=#{self.send(attr.name)}"
          end.join(', ')

          "[#{self.class.name.split('::').last}] #{attrs}"
        end

        module ClassMethods
          attr_reader :attributes

          def attribute(name, type, opts={})
            instance_eval do
              attr_accessor name
            end

            @attributes ||= []
            @attributes << Attribute.new(name, type, opts)
          end

          # This is a pretty naive implementation of parsing JSON. It will
          # loop through all of `@attributes` to find the right one, then do
          # some very minimal validation, before setting the attribute on the
          # instance.
          #
          # Returns an instance of the class that uses this mixin.
          def from_json(json)
            res = self.new

            json.each do |k, v|
              # TODO: Better way to do this?
              attr = @attributes.find{|a| a.json_field == k}
              raise InvalidAttribute.new(
                "`#{self.name.split('::').last}` did not define a `#{k}`."
              ) if attr.nil?

              # TODO: Better way to do this?
              case attr.type.to_s
              when Integer.to_s
                raise_invalid_value!(attr.type, k, v) unless v.is_a?(Fixnum) || (v.nil? && attr.allow_nil?)
                value = v.to_i
              when Float.to_s
                raise_invalid_value!(attr.type, k, v) unless v.is_a?(Float) || (v.nil? && attr.allow_nil?)
                value = v.to_f
              when String.to_s
                raise_invalid_value!(attr.type, k, v) unless v.is_a?(String) || (v.nil? && attr.allow_nil?)
                value = v
              when Hash.to_s
                raise_invalid_value!(attr.type, k, v) unless v.is_a?(Hash) || (v.nil? && attr.allow_nil?)
                value = v
              end

              res.send("#{attr.name}=", value)
            end

            res
          end

          private

          def raise_invalid_value!(expected, key, value)
            raise InvalidValue.new(
              "Expected #{expected}, got #{value.class}. `#{key}` (#{value})."
            )
          end

        end
      end
    end
  end
end
