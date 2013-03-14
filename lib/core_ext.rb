if defined? ActiveRecord::Base
  class ActiveRecord::Base
    def to_msgpack *args
      { self.class.model_name.element => serializable_hash }.to_msgpack *args
    end
  end
end
[:Date, :Time, :DateTime].each do |klass|
  begin
    Object.const_get(klass).class_eval do
      def to_msgpack *args
        as_json.to_msgpack *args
      end
    end
  rescue
  end
end
