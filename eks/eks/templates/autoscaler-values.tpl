autoDiscovery:
# Only cloudProvider `aws` and `gce` are supported by auto-discovery at this time
# AWS: Set tags as described in https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md#auto-discovery-setup
  clusterName: ${cluster_name}

autoscalingGroups: []
# autoscalingGroups:
#   - name: 
#     maxSize:
#     minSize: 

autoscalingGroupsnamePrefix: []
# At least one element is required if not using autoDiscovery
  # - name: ig01
  #   maxSize: 10
  #   minSize: 0
  # - name: ig02
  #   maxSize: 10
  #   minSize: 0

# Required if cloudProvider=aws
awsRegion: ${vpc_region}

# Currently only `gce`, `aws` & `spotinst` are supported
cloudProvider: aws

sslCertPath: /etc/kubernetes/pki/ca.crt

# Configuration file for cloud provider
cloudConfigPath: /etc/gce.conf

image:
  repository: k8s.gcr.io/cluster-autoscaler
  tag: v1.2.2
  pullPolicy: IfNotPresent

tolerations: []

extraArgs:
  v: 4
  stderrthreshold: info
  logtostderr: true
  # write-status-configmap: true
  # leader-elect: true
  # skip-nodes-with-local-storage: false
  # expander: least-waste
  # scale-down-enabled: true
  # balance-similar-node-groups: true
  # min-replica-count: 2
  # scale-down-utilization-threshold: 0.5
  # scale-down-non-empty-candidates-count: 5
  # max-node-provision-time: 15m0s
  # scan-interval: 10s
  # scale-down-delay: 10m
  # scale-down-unneeded-time: 10m
  # skip-nodes-with-local-storage: false
  # skip-nodes-with-system-pods: true

## Affinity for pod assignment
## Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
## affinity: {}

podDisruptionBudget: |
  maxUnavailable: 1
  # minAvailable: 2

## Node labels for pod assignment
## Ref: https://kubernetes.io/docs/user-guide/node-selection/
nodeSelector: {}

podAnnotations: {}
podLabels: {}
replicaCount: 1

rbac:
  ## If true, create & use RBAC resources
  ##
  create: true
  ## If true, create & use Pod Security Policy resources
  ## https://kubernetes.io/docs/concepts/policy/pod-security-policy/
  pspEnabled: false
  ## Ignored if rbac.create is true
  ##
  serviceAccountName: default

resources: {}
  # limits:
  #   cpu: 100m
  #   memory: 300Mi
  # requests:
  #   cpu: 100m
  #   memory: 300Mi

priorityClassName: ""

service:
  annotations: {}
  clusterIP: ""

  ## List of IP addresses at which the service is available
  ## Ref: https://kubernetes.io/docs/user-guide/services/#external-ips
  ##
  externalIPs: []

  loadBalancerIP: ""
  loadBalancerSourceRanges: []
  servicePort: 8085
  portName: http
  type: ClusterIP

spotinst:
  account: ""
  token: ""
  image:
    repository: spotinst/kubernetes-cluster-autoscaler
    tag: 0.6.0
    pullPolicy: IfNotPresent
