require "erb"
require "yaml"
require "erbprocess/version"

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
      config[key] = yml[key][env.downcase]
    end
    
    content = File.read(File.expand_path(@template))
    t = ERB.new(content)
    return t.result(binding)
  end
 
end
    
