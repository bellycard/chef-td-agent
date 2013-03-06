action :add do
    new_resource.updated_by_last_action(false)

    directory "/etc/td-agent/config.d" do
        owner "root"
        group "root"
        mode 0755
        action :create
    end

    template "/etc/td-agent/config.d/match-#{new_resource.name}.conf" do
        owner "root"
        group "root"
        mode 0644
        cookbook "td-agent"
        source "match-def.erb"
        variables({
            :name => new_resource.name,
            :match => new_resource.match,
            :type => new_resource.type,
            :path => new_resource.path,
            :format => new_resource.format,
            :time_slice_format => new_resource.time_slice_format,
            :buffer_type => new_resource.buffer_type,
            :buffer_path => new_resource.buffer_path
        })
        notifies :restart, "service[td-agent]"
        action :create
    end
end

action :remove do
    if ::File.exists?("/etc/td-agent/config.d/match-#{new_resource.name}.conf")
        Chef::Log.info "Removing match-#{new_resource.name}.conf from /etc/td-agent/config.d/"
        file "/etc/td-agent/config.d/match-#{new_resource.name}".conf do
            notifies :restart, "service[td-agent]"
            action :delete
        end
    new_resource.updated_by_last_action(true)
    end
end
