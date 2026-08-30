config {
  # Deep module inspection (replaces deprecated 'module = true')
  call_module_type = "all"
  force            = false
}

# Core Terraform / OpenTofu plugin
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# --- Enterprise IaC Governance & Clean Code Rules ---

# Enforce documentation: Every variable must have a 'description'
rule "terraform_documented_variables" {
  enabled = true
}

# Enforce documentation: Every output must have a 'description'
rule "terraform_documented_outputs" {
  enabled = true
}

# Enforce standard naming conventions for variables, outputs, and resources
rule "terraform_naming_convention" {
  enabled = true
}

# Flag any declared variables, locals, or providers that aren't being used
rule "terraform_unused_declarations" {
  enabled = true
}

# Enforce standard directory and file layouts
rule "terraform_standard_module_structure" {
  enabled = true
}
