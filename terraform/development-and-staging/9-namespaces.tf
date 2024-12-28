resource "kubernetes_namespace" "development" {
  metadata {
    annotations = {
      name = "development",
    }

    labels = {
      mylabel = "dev"
    }

    name = "development"
  }
}

resource "kubernetes_namespace" "staging" {
  metadata {
    annotations = {
      name = "staging",
    }

    labels = {
      mylabel = "staging"
    }

    name = "staging"
  }
}
