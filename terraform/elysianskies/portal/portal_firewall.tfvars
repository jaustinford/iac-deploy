instance_labels    = [
    "portal"
]
firewall_ingresses = [
    {
        name          = "ssh"
        external_port = "22"
        sources       = [
            "174.51.101.241/32"
        ]
    },
    {
        name          = "openvpnas"
        external_port = "1194"
        sources       = [
            "0.0.0.0/0"
        ]
    },
    {
        name          = "web"
        external_port = "443"
        sources       = [
            "0.0.0.0/0"
        ]
    }
]
