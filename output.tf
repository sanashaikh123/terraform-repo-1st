variable "names" {
    type = list
    default = ["sana","shaikh"]
  
}

output "hello" {
    value = "printing names ${upper(var.names[0])} ${upper(var.names[1])}"
  
}