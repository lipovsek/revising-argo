package kubernetes.validating.existence

deny[msg] {
	not input.request.object.metadata.labels.costcenter
	msg := "Every resource must have a costcenter label"
}

deny[msg] {
	value := input.request.object.metadata.labels.costcenter
	not startswith(value, "cost-")
	msg := sprintf("Costcenter code must start with `cost-`; found `%v`", [value])
}
