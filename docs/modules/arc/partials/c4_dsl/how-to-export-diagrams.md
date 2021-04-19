upgrade

scoop update structurizr-cli

- go into current folder containing the dsl script
- call cmd
- check version and adapt the command to use the correct version

default has the best results

>java -jar C:\Users\ggoer\scoop\apps\structurizr-cli\current\structurizr-cli-1.9.0.jar export -workspace dhw.dsl -format plantuml -output puml

this is the same as default

>java -jar C:\Users\ggoer\scoop\apps\structurizr-cli\current\structurizr-cli-1.8.1.jar export -workspace dhw.dsl -format plantuml/structurizr -output puml

>java -jar C:\Users\ggoer\scoop\apps\structurizr-cli\current\structurizr-cli-1.8.1.jar export -workspace dhw.dsl -format plantuml/basic -output puml_basic

>java -jar C:\Users\ggoer\scoop\apps\structurizr-cli\current\structurizr-cli-1.8.1.jar export -workspace dhw.dsl -format plantuml/c4plantuml -output puml_c4

mermaid

>java -jar C:\Users\ggoer\scoop\apps\structurizr-cli\current\structurizr-cli-1.8.1.jar export -workspace dhw.dsl -format mermaid -output mmd
