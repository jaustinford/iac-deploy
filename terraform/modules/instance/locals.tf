locals {
  instance_regions = {
    north_america = [
      "us-southeast", # US, Atlanta, GA
      "us-ord",       # US, Chicago, IL
      "us-central",   # US, Dallas, TX
      "us-west",      # US, Fremont, CA
      "us-lax",       # US, Los Angeles, CA
      "us-mia",       # US, Miami, FL
      "us-east",      # US, Newark, NJ
      "us-sea",       # US, Seattle, WA
      "us-iad"        # US, Washington, DC
    ]

    asia = [
      "id-cgk",       # ID, Jakarta
      "in-maa",       # IN, Chennai
      "ap-west",      # IN, Mumbai
      "in-bom-2",     # IN, Mumbai 2
      "jp-osa",       # JP, Osaka
      "ap-northeast", # JP, Tokyo 2
      "jp-tyo-3",     # JP, Tokyo 3
      "ap-south",     # SG, Singapore
      "sg-sin-2"      # SG, Singapore 2
    ]

    europe = [
      "eu-central", # DE, Frankfurt
      "de-fra-2",   # DE, Frankfurt 2
      "es-mad",     # ES, Madrid
      "fr-par",     # FR, Paris
      "eu-west",    # GB, London
      "gb-lon",     # GB, London 2
      "it-mil",     # IT, Milan
      "nl-ams",     # NL, Amsterdam
      "se-sto"      # SE, Stockholm
    ]

    oceania = [
      "au-mel",      # AU, Melbourne
      "ap-southeast" # AU, Sydney
    ]

    south_america = [
      "br-gru" # BR, Sao Paulo
    ]
  }
}
