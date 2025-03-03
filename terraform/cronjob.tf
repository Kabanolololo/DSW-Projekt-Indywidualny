resource "kubernetes_cron_job_v1" "simple_cronjob" {
  metadata {
    name      = "simple-cronjob"
    namespace = "namespace-number2"
  }

  spec {
    schedule = "* * * * *" # Uruchamianie co minutę

    job_template {
      metadata {
        name = "simple-cronjob-template"
      }

      spec {
        template {
          metadata {
            name = "simple-cronjob-pod"
          }

          spec {
            container {
              name  = "simple-cronjob-container"
              image = "busybox"
              command = [
                "/bin/sh",
                "-c",
                "date > /tmp/simple_cronjob.log && cat /tmp/simple_cronjob.log"
              ]
            }

            restart_policy = "OnFailure"
          }
        }
      }
    }
  }
}
