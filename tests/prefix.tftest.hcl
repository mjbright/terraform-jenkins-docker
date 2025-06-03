
# Here we must define any providers used by the module:

#terraform {
  #required_providers {
    #docker = {
      #source  = "kreuzwerker/docker"
      #version = "~> 3.5.0"
    #}
  #}
#}

# TEST:    prefix_net
# PURPOSE: Check that specifying a prefix as input
#          correctly affects resource naming
run prefix_net {
  command = plan
  
  plan_options {
    refresh = false
  }

  # Here we must define all required input variables to the module under test:
  variables {
    name_prefix    = "test-server-env1"
  }

  # Check the docker.container resource:
  assert {
    condition =  alltrue([ for name in module.be-servers.c_names : startswith(name, var.name_prefix) ])
    error_message = "Prefix ${var.name_prefix} not used for backend container resource"
  }  

}

