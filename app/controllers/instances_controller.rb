require 'docker'

class InstancesController < ApplicationController
  def create
    container = Docker::Container.create({
      "Image" => "quay.io/ae_nestor/hello:latest"
    })
    container.start({"PublishAllPorts" => true})
    get_ports_from(container)
  end

  private

    def get_ports_from(container)
      ports = container.json["NetworkSettings"]["Ports"]
      ssh = ports["22/tcp"].first["HostPort"]
      http = ports["3000/tcp"].first["HostPort"]
      puts "container: #{container.id} (ssh: #{ssh}, http: #{http})"
    end
end
