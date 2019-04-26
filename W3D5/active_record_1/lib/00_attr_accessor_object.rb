class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |attribute|
      define_method("#{attribute}=") do |value|
        instance_variable_set("@#{attribute}",value)
      end

       define_method(attribute) do 
        instance_variable_get("@#{attribute}")
      end
    end
  end
end
