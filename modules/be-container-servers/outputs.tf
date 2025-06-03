
output c_ips {
    value = [ for c in docker_container.c : c.network_data[0].ip_address ]
}

output c_names {
    value = [ for c in docker_container.c : c.name ]
}


