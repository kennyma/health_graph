module HealthGraph
  module Model
    include API
  
    attr_accessor :body
    
    def self.included(includer)
      includer.extend ClassMethods          
    end
        
    module ClassMethods
      def from_hash(hash) 
        instance = new(hash)
        yield instance if block_given?
        instance
      end
      
      def hash_attr_accessor(*symbols)
        attr_writer(*symbols)
        symbols.each do |symbol|
          define_method(symbol) do            
            instance_variable_get("@#{symbol}")
          end
        end
      end

      def coerce_key(key, into)
        define_method "unpack_#{key}" do |value|
          if value.is_a? into
            value

          elsif into.respond_to? :coerce
            into.coerce value

          else
            into.new value
          end
        end
      end
    end
    
    def populate_from_hash!(hash)
      return unless hash
      
      hash.each do |key, raw_value|
        unpack_method = "unpack_#{key}"
        set_attr_method = "#{key}="

        value = if respond_to?(unpack_method)
          self.__send__(unpack_method, raw_value)
        else
          raw_value
        end

        unless value.nil?
          if respond_to?(set_attr_method)
            self.__send__(set_attr_method, value)
          end
        end
      end
    end
  end
end