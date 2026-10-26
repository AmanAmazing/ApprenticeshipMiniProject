set -euo pipefail

: "${DOCKERHUB_USER:?DOCKERHUB_USER must be set}"
: "${IMAGE_TAG:?IMAGE_TAG must be set}"

K8S_DIR="$(cd "$(dirname "$0")" && pwd)/k8s"

for manifest in backend.yaml frontend.yaml; do
  echo "Applying ${manifest} (tag ${IMAGE_TAG})"
  sed -e "s|DOCKERHUB_USER|${DOCKERHUB_USER}|g" \
      -e "s|IMAGE_TAG|${IMAGE_TAG}|g" \
      "${K8S_DIR}/${manifest}" | kubectl apply -f -
done

kubectl rollout status deployment/backend  --timeout=180s
kubectl rollout status deployment/frontend --timeout=180s

kubectl get pods,svc -o wide

