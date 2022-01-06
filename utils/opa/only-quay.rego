package kubernetes.validating.images
 
deny[msg] {
 some i
 input.request.kind.kind == "Pod"
 image := input.request.object.spec.containers[i].image
 not startswith(image, "quay.io/")
 msg := sprintf("Image '%v' comes from untrusted registry(not from quay registry)", [image])
}
