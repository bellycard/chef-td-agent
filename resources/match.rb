actions :add, :remove
default_action :add

def initialize(*args)
    super
    @action = :add
end

attribute :name, :kind_of => String, :name_attribute => true
attribute :match, :kind_of => String, :required => true
attribute :type, :kind_of => String, :default => "file"
attribute :path, :kind_of => String
attribute :format, :kind_of => String
attribute :time_slice_format, :kind_of => String
attribute :buffer_type, :kind_of => String
attribute :buffer_path, :kind_of => String
