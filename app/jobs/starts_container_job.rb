class StartsContainerJob
  @queue = :high

  def self.perform(project_id, email)
    project = Project.find(project_id)
    container = Docker::Container.create({
      "Image" => "quay.io/ae_nestor/#{project.project_key}:latest"
    })
    container.start({"PublishAllPorts" => true})
    get_ports_from(container)
    InstanceNotificationsMailer.instance_creation(email, @ssh, @http).deliver
  end

  private

    def self.get_ports_from(container)
      ports = container.json["NetworkSettings"]["Ports"]
      @ssh = ports["22/tcp"].first["HostPort"]
      @http = ports["3000/tcp"].first["HostPort"]
    end
end
