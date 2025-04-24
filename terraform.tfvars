no_of_virtual_machines = 2

webapp_environment = {
  "northeuropeplan09986" = {
    service_plan_os_type  = "Windows"
    webapp_name           = "primarywebapp09876"
    service_plan_location = "North Europe"
    service_plan_sku_name = "S1"
  }

  "uksouthplan647580" = {
    service_plan_os_type  = "Windows"
    webapp_name           = "secondarywebapp35647"
    service_plan_location = "uk south"
    service_plan_sku_name = "S1"
  }
}

traffic_manager_endpoints = {
  "primaryendpoint" = {
    priority = 1
    weight = 100
  }

  "secondaryendpoint" = {
    priority = 2
    weight = 100
  }
}


Allow_security_rules = {
  "Allow_http" = {
    priority               = 100
    destination_port_range = 80
  }

  "Allow_ssh" = {
    priority               = 101
    destination_port_range = 22
  }

  "Allow_https" = {
    priority               = 110
    destination_port_range = 443
  }
}

dbapp_environment = {
  "production" = {
    server = {
      server895648 = {
        dbname = "appdb"
        sku    = "S0"
      }
    }
  }
}

# webapp_environment = {
#   "production" = {
#     serviceplan = {
#       serviceplan531665 = {
#         sku     = "S1"
#         os_type = "Windows"
#       }
#     }

#     serviceapp = {
#       webappp54658952 = "serviceplan531665"
#     }
#   }

#   "staging" = {
#     serviceplan = {
#       serviceplanstage569874 = {
#         sku     = "S1"
#         os_type = "Windows"
#       }
#     }

#     serviceapp = {
#       webapppstage89547 = "serviceplanstage569874"
#     }
#   }

# }