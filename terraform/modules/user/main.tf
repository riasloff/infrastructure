resource "selectel_iam_serviceuser_v1" "serviceuser_1" {
  name         = var.project_user_name
  password     = var.project_user_password
  role {
    role_name  = var.role_name
    scope      = var.scope_name
    project_id = var.project_id
  }
}