use Mix.Config
config :ranch_embeded_mode, ranch_tcp: [
  {:profile, true},
  {:listener_name, :ranch_embeded_mode_tcp_listener},
  {:acceptors, 5},
  {:transport, :ranch_tcp},
  {:transport_options, [port: 8000]}
]
config :ranch_embeded_mode, ranch_ssl: [
  {:profile, true},
  {:listener_name, :ranch_embeded_mode_ssl_listener},
  {:acceptors, 5},
  {:transport, :ranch_ssl},
  {:transport_options, [port: 4443]}
]
