locals {
  domain_name = "pendragonlab.com"
  domain_root = trimsuffix(local.domain_name, ".com")
  user_email  = "j.austin.ford@gmail.com"

  vpc_subnet_ipv4 = "192.168.80.0/29"

  iac = {
    ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3zWmwZOiPNh4Z6esor3FpuIYxD1gNkD4BCT37wkl7mxHmjvsDxaItF8e0VDe98rGemmQumDPmZNR4yzD3wf92p4pf/keXFhrc5rAboe0Dw8gjZSr9BXiDp9A9JJR+Z0JUcRWR7gk5Y7gzZOMfxIjYE8kv9W8iKnidInVo51uaVj6gK2qisqxWERqkhH9Tu1fJgSeo30Soqb8cNSdXqeiirn4D83QPu+P6xkSUZ//VXLThSwEBVsJCtG4cjMjBWEf5qtiCjgz9X+IDbqV7Bn0NEHN3HQsPHNNIXlZ3wtJJNSUJq1OpsujqXKk/tQGV09Q4H9Ixr4bZjiD1zZk82yGWahLT5S8Yq0/mgVz3tgP4W68A3EEujp+mkDFadUtiYVb15t24AWm4ZKvaO8fA7KkWHYbiULIMPeoLdd7oO0yhcF3oiKyBx+3xnHgjkxpcqUjUFvF/pbM5WwA788GdaD7Md9+4vEfmpAo0Ivrs2q9A4BusX8eSH6L+IG7z5Hp7+spB42tlk1tQJMTjBy0i5ISFdH/AYf6xVEUuWlot28W6koSJ1qlYJfmIeAw5a8YrFWtSU8j+VS7bM4Gu8E5M8uRePU/c/G+qLcK96L8nCBHJ2edBzLBWw6KvjzZRoaZRqvZjrH3vyUvY9yYqtOhib+6qeNykDquIloLyepIvuxMURw== iac-configure@pendragonlab.com"
  }  

  drop_cidrs = ["8.8.8.8/32"]
}
