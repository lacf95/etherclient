module EtherClient::Attrs
  def attrs(data)
    data.each do |key, value|
      attr_name = underscore(key)
      self.instance_variable_set("@#{attr_name}", value)
      self.class.__send__(:attr_accessor, attr_name)
    end
  end

  def underscore(old_name)
    new_name = old_name.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").downcase
  end
end
