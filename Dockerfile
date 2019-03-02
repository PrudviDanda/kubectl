FROM alpine:3.8

ENV KUBECTL_VERSION v1.13.3

# Install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-using-curl
ADD https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    # Basic check it works.
    kubectl version --client

WORKDIR /root
ENTRYPOINT ["/bin/sh"]
#COPY /k8s /k8s
#RUN kubectl config set-cluster sample-cluster --server=https://hello.com:443 --certificate-authority=k8s/ca-crt && \
#    kubectl config set-context k8s --cluster=sample-cluster
