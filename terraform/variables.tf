# Zmienna dla portów serwisów (łącznie z portem bazy danych)
variable "service_ports" {
  type = list(object({
    port        = number
    target_port = number
  }))
  default = [
    { port = 80, target_port = 80 },
    { port = 443, target_port = 443 },
    { port = 5432, target_port = 5432 } # Port bazy danych
  ]
}
