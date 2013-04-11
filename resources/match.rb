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
attribute :flush_interval, :kind_of => String
attribute :buffer_type, :kind_of => String
attribute :buffer_path, :kind_of => String
attribute :buffer_chunk_limit, :kind_of => String
attribute :utc, :kind_of => [TrueClass, FalseClass], :default => false

# S3 specific
# TODO Move plugin specific attributes elsewhere
attribute :aws_key_id, :kind_of => String
attribute :aws_sec_key, :kind_of => String
attribute :s3_bucket, :kind_of => String
attribute :s3_endpoint, :kind_of => String
attribute :store_as, :kind_of => String
attribute :format_json, :kind_of => [TrueClass, FalseClass], :default => false

# HDFS specific
# TODO Move plugin specific attributes elsewhere
attribute :hdfs_host, :kind_of => String
attribute :hdfs_port, :kind_of => Fixnum
attribute :hdfs_path, :kind_of => String
attribute :hdfs_user, :kind_of => String
attribute :httpfs, :kind_of => [TrueClass, FalseClass], :default => false

# Forward specific
# TODO Move plugin specific attributes elsewhere
attribute :forward_host, :kind_of => String
attribute :forward_port, :kind_of => Fixnum, :default => 24224
