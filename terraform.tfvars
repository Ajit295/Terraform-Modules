no_of_virtual_machines = 2

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

webapp_environment = {
  "production" = {
    serviceplan = {
      serviceplan531665 = {
        sku     = "S1"
        os_type = "Windows"
      }
    }

    serviceapp = {
      webappp54658952 = "serviceplan531665"
    }
  }

  "staging" = {
    serviceplan = {
      serviceplanstage569874 = {
        sku     = "S1"
        os_type = "Windows"
      }
    }

    serviceapp = {
      webapppstage89547 = "serviceplanstage569874"
    }
  }

}