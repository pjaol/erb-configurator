require "erb"
require "yaml"
require "erbprocess/version"
require 'socket'

module ERBProcess

  def ERBProcess.process variables, template, env = "DEV"
    @variables =  variables
    @template = template
    @env = env
    
    yml = YAML.load_file(@variables)
    #puts @template
    #puts yml.inspect
    config = {}
    yml.each_key do |key|
      if yml[key].has_key?(env.downcase)
        config[key] = yml[key][env.downcase]
      else
        warn "WARNING: "<< @variables<<" does not have a "<<key<<" for environment "<<env
      end
    end
    
    content = File.read(File.expand_path(@template))
    t = ERB.new(content)
    return t.result(binding)
  end
  
  def ERBProcess.gethostname
    return Socket.gethostname.first
  end
 
end
    
