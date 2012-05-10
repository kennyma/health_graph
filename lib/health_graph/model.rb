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
    end
    
    def populate_from_hash!(hash)
      return unless hash
      
      hash.each do |key, raw_value|
        coerce_method = "coerce_#{key}"
        set_attr_method = "#{key}="

        value = if respond_to?(coerce_method)
          self.__send__(coerce_method, raw_value)
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