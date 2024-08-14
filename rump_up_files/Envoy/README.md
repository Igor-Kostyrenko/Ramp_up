<p align="left">
 <img width="600px" src="envoy_logo2.png" alt="qr"/>
</p>

## Envoy proxy Reverse Proxy Basic Example

### Basic Example  - deploy Envoy as a proxy in front of our microservice server
### All incoming requests will be directed to the Envoy server, which will route them to the appropriate service. 

#### YAML config file Envoy proxy

 ```yml
    static_resources:
  listeners:
    - name: listener_0  # Identifier for the listener
      address:
        socket_address:
          address: 0.0.0.0  # Listen on all available network interfaces
          port_value: 10000  # Port number on which Envoy listens for incoming traffic
      filter_chains:
        - filters:
            - name: envoy.filters.network.http_connection_manager  # HTTP connection manager filter
              typed_config:
                "@type": type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager
                stat_prefix: ingress_http  # This is used to collect the statistics
                codec_type: AUTO  # Automatically choose the appropriate codec for HTTP connections
                route_config:
                  name: local_route  # Identifier for the route configuration
                  virtual_hosts:
                    - name: local_service  # Identifier for the virtual host
                      domains: ["*"]  # Match all domains
                      routes:
                        - match:
                            prefix: "/"  # Match all paths
                          route:
                            cluster: service_behind_envoy  # Route matched requests to this cluster
                http_filters:
                  - name: envoy.filters.http.router  # HTTP router filter, which performs the routing

  clusters:
    - name: service_behind_envoy  # Identifier for the cluster
      connect_timeout: 0.25s  # Timeout for connecting to the upstream service
      type: STRICT_DNS  # Cluster discovery type, resolves via DNS
      lb_policy: ROUND_ROBIN  # Load balancing policy, distributes requests evenly across endpoints
      dns_lookup_family: V4_ONLY  # Restrict DNS lookups to IPv4 addresses
      load_assignment:
        cluster_name: service_behind_envoy  # Identifier for the cluster
        endpoints:
          - lb_endpoints:
              - endpoint:
                  address:
                    socket_address:
                      address: nodeapp  # Hostname or IP address of the endpoint, this is pointing to a docker service
                      port_value: 8080  # Port number of the endpointStatic Resources
```