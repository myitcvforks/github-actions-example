package workflows

import (
	"strings"
	"tool/file"
	"encoding/yaml"
)

command: genworkflows: {
	for k, w in workflows {
		(k): file.Create & {
			filename: strings.ToLower(k) + ".yml"
			contents: yaml.Marshal(w)
		}
	}
}
