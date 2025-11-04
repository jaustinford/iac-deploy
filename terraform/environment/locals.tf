locals {
  domain_name = "pendragonlab.com"
  domain_root = trimsuffix(local.domain_name, ".com")
  user_email  = "j.austin.ford@gmail.com"

  deny_cidrs = [
    # source.as.network #             source.as.organization_name | source.geo.city_name, source.geo.region_name

    # Brazil Nginx flood - October 2025

    "45.173.24.0/22",  #                        HEXA TELECOM LTDA | Teófilo Otoni, Minas Gerais
    "131.100.72.0/22", # NETPONTAL PROVEDOR DE INTERNET LTDA - ME | Pontal, São Paulo
    "138.36.108.0/22", #           Elite Telecomunicacoes LTDA ME | Itamogi, Minas Gerais
    "177.8.132.0/22",  #         JET NETWORK TELECOMUNICACAO LTDA | Cubatão, São Paulo
    "177.10.172.0/22", #   Anderson Marcos Coelho e Cia Ltda - ME |
    "177.10.232.0/21", #                          RADAR WISP LTDA | Anápolis, Goiás
    "179.108.44.0/22", #                          GD NET SOLUTION |
    "190.83.84.0/22",  #             NETCOM TELECOMUNICACOES LTDA | Guarujá, São Paulo
    "200.106.148.0/22" #  Louvetel Comunicacao Comercial SCM Ltda | Campinas, São Paulo
  ]
}
