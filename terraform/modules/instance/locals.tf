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

  instance_types = [
    "g6-nanode-1",         #    Nanode   1 GB                   | 1  vCPU | 1   GB RAM | $ 0.0075 hr
    "g6-standard-1",       #    Linode   2 GB                   | 1  vCPU | 2   GB RAM | $ 0.018  hr
    "g6-standard-2",       #    Linode   4 GB                   | 2  vCPU | 4   GB RAM | $ 0.036  hr
    "g6-standard-4",       #    Linode   8 GB                   | 4  vCPU | 8   GB RAM | $ 0.072  hr
    "g6-standard-6",       #    Linode  16 GB                   | 6  vCPU | 16  GB RAM | $ 0.144  hr
    "g6-standard-8",       #    Linode  32 GB                   | 8  vCPU | 32  GB RAM | $ 0.288  hr
    "g6-standard-16",      #    Linode  64 GB                   | 16 vCPU | 64  GB RAM | $ 0.576  hr
    "g6-standard-20",      #    Linode  96 GB                   | 20 vCPU | 96  GB RAM | $ 0.864  hr
    "g6-standard-24",      #    Linode 128 GB                   | 24 vCPU | 128 GB RAM | $ 1.152  hr
    "g6-standard-32",      #    Linode 192 GB                   | 32 vCPU | 192 GB RAM | $ 1.728  hr
    "g7-highmem-1",        #    Linode  24 GB                   | 2  vCPU | 24  GB RAM | $ 0.09   hr
    "g7-highmem-2",        #    Linode  48 GB                   | 2  vCPU | 48  GB RAM | $ 0.18   hr
    "g7-highmem-4",        #    Linode  90 GB                   | 4  vCPU | 90  GB RAM | $ 0.36   hr
    "g7-highmem-8",        #    Linode 150 GB                   | 8  vCPU | 150 GB RAM | $ 0.72   hr
    "g7-highmem-16",       #    Linode 300 GB                   | 16 vCPU | 300 GB RAM | $ 1.44   hr
    "g6-dedicated-2",      # Dedicated   4 GB                   | 2  vCPU | 4   GB RAM | $ 0.054  hr
    "g6-dedicated-4",      # Dedicated   8 GB                   | 4  vCPU | 8   GB RAM | $ 0.108  hr
    "g6-dedicated-8",      # Dedicated  16 GB                   | 8  vCPU | 16  GB RAM | $ 0.216  hr
    "g6-dedicated-16",     # Dedicated  32 GB                   | 16 vCPU | 32  GB RAM | $ 0.432  hr
    "g6-dedicated-32",     # Dedicated  64 GB                   | 32 vCPU | 64  GB RAM | $ 0.864  hr
    "g6-dedicated-48",     # Dedicated  96 GB                   | 48 vCPU | 96  GB RAM | $ 1.296  hr
    "g6-dedicated-50",     # Dedicated 128 GB                   | 50 vCPU | 128 GB RAM | $ 1.728  hr
    "g6-dedicated-56",     # Dedicated 256 GB                   | 56 vCPU | 256 GB RAM | $ 3.456  hr
    "g1-gpu-rtx6000-1",    # Dedicated  32 GB + RTX6000 GPU x1  | 8  vCPU | 32  GB RAM | $ 1.5    hr
    "g1-gpu-rtx6000-2",    # Dedicated  64 GB + RTX6000 GPU x2  | 16 vCPU | 64  GB RAM | $ 3.0    hr
    "g1-gpu-rtx6000-3",    # Dedicated  96 GB + RTX6000 GPU x3  | 20 vCPU | 96  GB RAM | $ 4.5    hr
    "g1-gpu-rtx6000-4",    # Dedicated 128 GB + RTX6000 GPU x4  | 24 vCPU | 128 GB RAM | $ 6.0    hr
    "g7-premium-2",        #   Premium   4 GB                   | 2  vCPU | 4   GB RAM | $ 0.0645 hr
    "g7-premium-4",        #   Premium   8 GB                   | 4  vCPU | 8   GB RAM | $ 0.129  hr
    "g7-premium-8",        #   Premium  16 GB                   | 8  vCPU | 16  GB RAM | $ 0.2595 hr
    "g7-premium-16",       #   Premium  32 GB                   | 16 vCPU | 32  GB RAM | $ 0.519  hr
    "g7-premium-32",       #   Premium  64 GB                   | 32 vCPU | 64  GB RAM | $ 1.0365 hr
    "g7-premium-48",       #   Premium  96 GB                   | 48 vCPU | 96  GB RAM | $ 1.5555 hr
    "g7-premium-50",       #   Premium 128 GB                   | 50 vCPU | 128 GB RAM | $ 2.073  hr
    "g7-premium-56",       #   Premium 256 GB                   | 56 vCPU | 256 GB RAM | $ 4.1475 hr
    "g2-gpu-rtx4000a1-s",  # RTX4000 Ada x1 Small               | 4  vCPU | 16  GB RAM | $ 0.52   hr
    "g2-gpu-rtx4000a1-m",  # RTX4000 Ada x1 Medium              | 8  vCPU | 32  GB RAM | $ 0.67   hr
    "g2-gpu-rtx4000a1-l",  # RTX4000 Ada x1 Large               | 16 vCPU | 64  GB RAM | $ 0.96   hr
    "g2-gpu-rtx4000a1-xl", # RTX4000 Ada x1 X-Large             | 32 vCPU | 128 GB RAM | $ 1.53   hr
    "g2-gpu-rtx4000a2-s",  # RTX4000 Ada x2 Small               | 8  vCPU | 32  GB RAM | $ 1.05   hr
    "g2-gpu-rtx4000a2-m",  # RTX4000 Ada x2 Medium              | 16 vCPU | 64  GB RAM | $ 1.34   hr
    "g2-gpu-rtx4000a2-hs", # RTX4000 Ada x2 Medium High Storage | 16 vCPU | 64  GB RAM | $ 1.49   hr
    "g2-gpu-rtx4000a4-s",  # RTX4000 Ada x4 Small               | 32 vCPU | 128 GB RAM | $ 2.96   hr
    "g2-gpu-rtx4000a4-m"   # RTX4000 Ada x4 Medium              | 48 vCPU | 196 GB RAM | $ 3.57   hr
  ]

  instance_images = [
    "linode/almalinux8",             # AlmaLinux 8
    "linode/almalinux9",             # AlmaLinux 9
    "linode/alpine3.18",             # Alpine 3.18
    "linode/alpine3.19",             # Alpine 3.19
    "linode/alpine3.20",             # Alpine 3.20
    "linode/arch",                   # Arch Linux
    "linode/centos-stream9",         # CentOS Stream 9
    "linode/debian11",               # Debian 11
    "linode/debian12",               # Debian 12
    "linode/fedora40",               # Fedora 40
    "linode/fedora41",               # Fedora 41
    "linode/gentoo",                 # Gentoo
    "linode/kali",                   # Kali Linux
    "linode/debian12-kube-v1.28.12", # Kubernetes 1.28.12 on Debian 12
    "linode/debian12-kube-v1.29.7",  # Kubernetes 1.29.7  on Debian 12
    "linode/debian12-kube-v1.30.3",  # Kubernetes 1.30.3  on Debian 12
    "linode/debian12-kube-v1.31.0",  # Kubernetes 1.31.0  on Debian 12
    "linode/opensuse15.6",           # openSUSE Leap 15.6
    "linode/rocky8",                 # Rocky Linux 8
    "linode/rocky9",                 # Rocky Linux 9
    "linode/slackware15.0",          # Slackware 15.0
    "linode/ubuntu20.04",            # Ubuntu 20.04 LTS
    "linode/ubuntu22.04",            # Ubuntu 22.04 LTS
    "linode/ubuntu24.04",            # Ubuntu 24.04 LTS
    "linode/ubuntu24.10",            # Ubuntu 24.10
    "linode/alpine3.17",             # Alpine 3.17        ( deprecated )
    "linode/fedora39",               # Fedora 39          ( deprecated )
    "linode/opensuse15.5",           # openSUSE Leap 15.5 ( deprecated )
    "linode/ubuntu16.04lts",         # Ubuntu 16.04 LTS   ( deprecated )
    "linode/ubuntu18.04"             # Ubuntu 18.04 LTS   ( deprecated )
  ]
}
