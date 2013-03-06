actions :add, :remove
default_action :add

def initialize(*args)
    super
    @action = :add
end

attribute :name, :kind_of => String, :name_attribute => true
attribute :type, :kind_of => String, :required => true
attribute :port, :kind_of => Fixnum, :default => 24224

