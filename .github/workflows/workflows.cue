package workflows

import "json.schemastore.org/github"

workflows: [string]: _bashWorkflow

_bashWorkflow: github.#Workflow & {
	jobs: [string]: defaults: run: shell: "bash"
}
