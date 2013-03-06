action :add do
    new_resource.updated_by_last_action(false)

    directory "/etc/td-agent/config.d" do
        owner "root"
        group "root"
        mode 0755
        action :create
    end

    template "/etc/td-agent/config.d/source-#{new_resource.name}.conf" do
        owner "root"
        group "root"
        mode 0644
        cookbook "td-agent"
        source "source-def.erb"
        variables({
            :name => new_resource.name,
            :type => new_resource.type,
            :port => new_resource.port
        })
        notifies :restart, "service[td-agent]"
        action :create
    end
end

action :remove do
    if ::File.exists?("/etc/td-agent/config.d/source-#{new_resource.name}.conf")
        Chef::Log.info "Removing source-#{new_resource.name}.conf from /etc/td-agent/config.d/"
        file "/etc/td-agent/config.d/source-#{new_resource.name}.conf" do
            notifies :restart, "service[td-agent]"
            action :delete
        end
    new_resource.updated_by_last_action(true)
    end
end
