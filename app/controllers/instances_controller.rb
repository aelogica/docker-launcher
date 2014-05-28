class InstancesController < ApplicationController
  def create
    container = Docker::Container.run({
      "Image" => "quay.io/ae_nestor/hello:latest",
      "PublishAllPorts" => true
    })
    binding.pry
  end
end
