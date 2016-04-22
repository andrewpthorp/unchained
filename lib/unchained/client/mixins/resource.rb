module Unchained
  class Client
    module Mixins
      module Resource
        def self.included(base)
          base.extend ClassMethods
        end

        def to_s
          attributes = self.class::JSON_MAP.map{|k,_| "#{k}=#{self.send(k)}"}.join(" ")
          "[#{self.class_name}] #{attributes}"
        end

        # Lurk, is there not a better way to do this?
        def class_name
          self.class.name.split('::').last
        end

        module ClassMethods
          JSON_MAP = {}

          def resource(json_map)
            instance_eval do
              const_set("JSON_MAP", json_map)
            end

            class_eval do
              attr_accessor(*json_map.keys)
            end
          end

          def decode_result(json)
            instance = self.new
            self::JSON_MAP.each do |k,v|
              instance.send("#{k}=", json[v])
            end
            instance
          end
        end
      end
    end
  end
end
