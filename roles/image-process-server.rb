name 'image-process-server'
default_attributes({
  "nginx" => {
    "modules" => [
      "nginx::http_ssl_module",
      "nginx::http_gzip_static_module",
      "nginx::small_light_module"
    ]
  }
})
run_list 'nginx::source'
