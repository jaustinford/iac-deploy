locals {
  vpc_regions = {
    north_america = [
      "us-ord", # US, Chicago, IL
      "us-lax", # US, Los Angeles, CA
      "us-mia", # US, Miami, FL
      "us-sea", # US, Seattle, WA
      "us-iad"  # US, Washington, DC
    ]

    asia = [
      "id-cgk",   # ID, Jakarta
      "in-maa",   # IN, Chennai
      "in-bom-2", # IN, Mumbai 2
      "jp-osa",   # JP, Osaka
      "jp-tyo-3", # JP, Tokyo 3
      "sg-sin-2"  # SG, Singapore 2
    ]

    europe = [
      "de-fra-2", # DE, Frankfurt 2
      "es-mad",   # ES, Madrid
      "fr-par",   # FR, Paris
      "gb-lon",   # GB, London 2
      "it-mil",   # IT, Milan
      "nl-alms",  # NL, Amsterdam
      "se-sto"    # SE, Stockholm
    ]

    oceania = [
      "au-mel" # AU, Melbourne
    ]

    south_america = [
      "br-gru" # BR, Sao Paulo
    ]
  }
}
