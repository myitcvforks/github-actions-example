package workflows

import "json.schemastore.org/github"

workflows: [string]: _bashWorkflow

_bashWorkflow: github.#Workflow & {
	jobs: [string]: defaults: run: shell: "bash"
}

_setupGo: github.#step & {
	name: "Install Go"
	uses: "actions/setup-go@v3"
	with: "go-version": string
}
