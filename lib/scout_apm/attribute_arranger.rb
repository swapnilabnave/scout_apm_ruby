module ScoutApm
  module AttributeArranger
    # pass in an array of symbols to return as hash keys
    # if the symbol doesn't match the name of the method, pass an array: [:key, :method_name]
    def self.call(subject, attributes_list)
      attributes_list.inject({}) do |attribute_hash, attribute|
        case attribute
        when Array
          attribute_hash[attribute[0]] = subject.send(attribute[1])
        when Symbol
          attribute_hash[attribute] = subject.send(attribute)
        end
        attribute_hash
      end
    end
  end
end
