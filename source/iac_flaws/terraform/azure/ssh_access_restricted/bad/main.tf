# fail

resource "azurerm_network_security_rule" "ssh" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range  = 22
  source_address_prefix   = "*"
  destination_port_ranges = null
  source_address_prefixes = null
}

resource "azurerm_network_security_rule" "all" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = "*"
  source_address_prefix  = "Internet"
}

resource "azurerm_network_security_rule" "range" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = "20-25"
  source_address_prefix  = "Internet"
}

resource "azurerm_network_security_rule" "ranges_prefixes" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = null
  source_address_prefix  = null
  destination_port_ranges = [
    22,
    443
  ]
  source_address_prefixes = [
    "Internet",
    "10.0.0.0/16"
  ]
}

resource "azurerm_network_security_group" "ranges" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"

  security_rule {
    name      = "example"
    access    = "Allow"
    direction = "Inbound"
    priority  = 100
    protocol  = "Tcp"

    destination_port_ranges = [
      "22-25",
      "8000-9000"
    ]
    source_address_prefix = "*"
  }
}

# lower case

resource "azurerm_network_security_rule" "ranges_prefixes_lower_case" {
  name                        = "example"
  access                      = "allow"
  direction                   = "inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = null
  source_address_prefix  = null
  destination_port_ranges = [
    22,
    443
  ]
  source_address_prefixes = [
    "internet",
    "10.0.0.0/16"
  ]
}

resource "azurerm_network_security_rule" "range_prefix_lower_case" {
  name                        = "example"
  access                      = "allow"
  direction                   = "inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = "22-25"
  source_address_prefix  = "internet"
}
