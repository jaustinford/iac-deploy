domain_name      = "elysianskies.com"
domain_soa_email = "j.austin.ford@gmail.com"
domain_dns_ttl   = 300
instance_labels  = [
    "portal"
]
domain_records   = [
    {
        name        = "home"
        record_type = "CNAME"
        target      = "portal.elysianskies.com"
    },
    {
        name        = "*.home"
        record_type = "CNAME"
        target      = "home.elysianskies.com"
    }
]
