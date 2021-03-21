workspace {
    model {
        enterprise "Customer" {
            dwh_developer = person "DWH Developer" "Developer of some DWH"
            deployment_team = person "Deployment Team"
            project_b_dwh_user = person "Project B DWH User" "user of DWH (Project B)"

            project_b_dev = softwareSystem "DWH B Development" {
                project_b_repo_db = container "Repository db (Project B)" "" "Database" "Database" {
                    repo_synonyms = component "Synonyms" "Synonyms are used to connect the repository database with the corresponding DWH database"
                    repo_Configuration = component "Configuration" "Connection with DWH database and various settings for the behavior of the processes in the repository."
                    repo_RepoObject = component "RepoObject" "Central construct to represent objects (tables, views, procedures, functions, index, ...) and their subunits (columns, index columns, procedure parameters, ...), their properties and relationships between them."
                    repo_SqlParser = component "SqlParser" "Parse the code of views to extract column-level references or other logic from them"
                    repo_Reference = component "Reference" "Determination and management of references (dependencies) between RepoObjects or RepoObject columns"
                    repo_Inheritance = component "Inheritance" "Inheritance or determination of extended properties for RepoObjects or RepoObject columns, based on references"
                    repo_generator_usp = component "USP Generator" "usp (userdefined stored procedures) can be generated in a formalized way: containing optional logging and some workflow elements (sub procedures, conditions, parent-child logic)"
                    repo_generator_persistence = component "Persistence Generator" "Views or tables can be persisted in tables, with or without history with temporal tables. Code for performing the persistations is created."
                    repo_generator_view = component "View Generator" "Not yet implemented"
                    repo_Workflow = component "Workflow" "A workflow executes procedures in a specific and necessary order."
                    repo_visualization = component "Visualization" "preparation for Visualization of data lineage (references), real and virtual PK, FK-PK"
                }
                project_b_dev_dwh_db = container "DWH db Development (Project B)" "" "Database" "Database" {
                    dwh_sys = component "System views and procedures"
                    dwh_extended_properties = component "Extended Properties"
                    project_b_sqlsever_objects = component "SQL Server objects"
                }
                GUI = container "GUI" "Graphical User Interface" "GUI" "GUI" {
                    gui_visualization = component "Visualization GUI" "Visualization of data lineage (references), real and virtual PK, FK-PK" "?" "GUI"
                    gui_crud = component "CRUD GUI" "CRUD - Create, Read, Update, Delete" "?" "GUI"

                }
            }
            project_b_prod = softwareSystem "DWH B Production" {
                project_b_prod_dwh_db = container "DWH db Production (Project B)" "" "Database" "Database"
            }
            project_b_git = softwareSystem "DWH B git" "Code of Project B in Version Control (git, subversion, ...)" "git"
        }

        dhw_developer = person "DHW Developer" "Developer of DataHandwerk Toolkit"

        project_a_dwh_dev = softwareSystem "DataHandwerk Development" {
            project_a_repo_db = container "Repository db (Project A)" "" "Database" "Database"
            project_a_dwh_db = container "DWH db (Project A)" "" "Database" "Database"
        }
        dhw_git = softwareSystem "DataHandwerk git" "Code of DataHandwerk in Version Control" "git"
 

        dhw_developer -> project_a_dwh_dev "uses for testing and development"
        dhw_developer -> dhw_git "uses"

        dwh_developer -> dhw_git "takes code or builds"
        dwh_developer -> project_b_dev "developes"
        dwh_developer -> project_b_git "uses"

        deployment_team -> project_b_git "takes code or builds"
        deployment_team -> project_b_prod_dwh_db "deployes on production system"

        project_b_dwh_user -> project_b_prod_dwh_db "uses"

        repo_synonyms -> dwh_sys "Synonyms link to DWH System Views"
        dwh_extended_properties -> repo_RepoObject "RepoObject correspond with extended properties"
        repo_RepoObject -> dwh_extended_properties

        repo_RepoObject -> repo_synonyms
        repo_SqlParser -> repo_synonyms

        repo_Reference -> repo_RepoObject
        repo_Inheritance -> repo_RepoObject
        repo_generator_usp -> repo_RepoObject
        repo_generator_persistence -> repo_RepoObject
        repo_generator_view -> repo_RepoObject

        repo_Reference -> repo_SqlParser

        repo_Inheritance -> repo_Reference
        repo_Workflow -> repo_Reference
        repo_generator_persistence -> repo_Reference
        repo_visualization -> repo_Reference

        repo_generator_persistence -> repo_generator_usp
        repo_generator_view -> repo_SqlParser

        dwh_sys -> project_b_sqlsever_objects "describe"
        dwh_extended_properties -> project_b_sqlsever_objects "enrich them with additional information"

        gui_visualization -> repo_visualization "uses"

    }
    views {
        // systemlandscape "SystemLandscape" {
        //     include *
        //     autoLayout
        // }
        // // systemContext dhw_toolkit {
        // //     include *
        // //     autoLayout
        // // }
        // // systemContext project_a_dwh_dev {
        // //     include *
        // //     autoLayout
        // // }
        // systemContext project_b_dev {
        //     include *
        //     autoLayout
        // }
        // systemContext project_b_prod {
        //     include *
        //     autoLayout
        // }
        // container project_b_dev {
        //     include *
        //     autoLayout
        // }
        // component project_b_repo_db {
        //     include *
        //     autoLayout
        // }
        // component project_b_dev_dwh_db {
        //     include *
        //     autoLayout
        // }
        styles {
            element "Database" {
                shape cylinder
            }
            element "GUI" {
                shape WebBrowser
            }
            element "git" {
                shape Folder
            }
            element "Person" {
                shape Person
            }
        }
    }

}