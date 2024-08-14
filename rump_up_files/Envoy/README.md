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

`static_resources`
#### It is a section where listeners and clusters are defined.

## [**Listeners**]() 
#### A listener specifies where the Envoy should listen for incoming connections.

- name: Identifier for the listener (listener_0).
- address: Network address where the listener should bind.
- socket_address:
  - address: `0.0.0.0` means Envoy will listen on all available network interfaces.
  - port_value: `10000` is the port number on which Envoy listens for incoming traffic.

## [**Filter Chains**]() 
#### A filter chain processes incoming connections.

- filters: List of filters to apply to the connections.
- name: Specifies the filter `(envoy.filters.network.http_connection_manager)`.
- typed_config: Configuration for the HTTP connection manager.
- @type: Type the URL for the HTTP connection manager configuration.
- stat_prefix: Prefix for statistics related to this HTTP connection manager `(ingress_http)`.
- codec_type: Codec type for handling HTTP connections (`AUTO` allows Envoy to choose the appropriate codec).
  - AUTO: Envoy will automatically determine the appropriate codec type to use.
  - HTTP1: Envoy will use the HTTP/1.1 codec.
  - HTTP2: Envoy will use the HTTP/2 codec.
  - HTTP3: Envoy will use the HTTP/3 codec (if available and supported).
- route_config: Configuration for routing incoming HTTP requests.
- name: Identifier for the route `(local_route)`.
- virtual_hosts: Virtual hosts configuration.
- name: Identifier for the virtual host `(local_service)`.
- domains: List of domains this virtual host handles `(* matches all domains)`.
- routes: List of routing rules.
- match: Condition to match incoming requests.
- route: Action to take for matched requests.
- cluster: Specifies the upstream cluster to route to `(service_behind_envoy)`.
- http_filters: List of HTTP filters.
- name: Specifies the HTTP router filter `(envoy.filters.http.router)`, which performs the routing.

## [**Clusters**]() 
#### A cluster defines an upstream service that Envoy can route to.

- name: Identifier for the cluster `(service_behind_envoy)`.
- connect_timeout: Timeout for connecting to the upstream service `(0.25s)`.
- type: Cluster discovery type (`STRICT_DNS` means the cluster resolves via DNS).
- lb_policy: Load balancing policy (`ROUND_ROBIN` distributes requests evenly across endpoints).
- dns_lookup_family: DNS lookup family (`V4_ONLY` restricts DNS lookups to IPv4 addresses).
- load_assignment: Static assignment of endpoints to the cluster.
- cluster_name: Identifier for the cluster (`service_behind_envoy`).
- endpoints: List of endpoints for the cluster.
- lb_endpoints: Load balancing endpoints.
- endpoint: Individual endpoint details.
- address: Network address of the endpoint.
- socket_address:
- address: Hostname or IP address of the endpoint (`nodeapp`).
- port_value: Port number of the endpoint (`8080`).