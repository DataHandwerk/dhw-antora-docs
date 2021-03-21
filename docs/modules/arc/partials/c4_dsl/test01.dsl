workspace {

    model {
        user = person "User"
        softwareSystem "Software System" {
            wa = container "Web Application" {
                hpc = component "HomePageController"
            }
            db = container "Database"
         }

        user -> hpc
        hpc -> db

        deploymentEnvironment "Development" {
            deploymentNode "Developer Laptop" {
                containerInstance wa
                containerInstance db
            }
        }

        deploymentEnvironment "Live" {
            deploymentNode "Amazon Web Services" {
                route53 = infrastructureNode "Route 53"
                deploymentNode "EC2" {
                    wa_live = containerInstance wa
                    containerInstance db
                }
            }
        }

        route53 -> wa_live
    }

}