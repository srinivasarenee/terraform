output "upper_usernames" {
  # value = [for name in var.usernames : upper(name)]
  value = [for name in var.usernames : upper(name)]
}
output "user_lengths" {
  value = { for name in var.usernames : name => length(name) }
}
output "upper_environments" {
  value = { for key, val in var.environments : key => upper(val) }
}