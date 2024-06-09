variable "files" {
  default = {
    "alfa"    = "Content for alfa"
    "gama"    = "Content for gama"
    "beta"    = "Content for beta"
    "delta"   = "Content for delta"
    "epsilon" = "Content for epsilon"
  }
  type = map(string)
}

