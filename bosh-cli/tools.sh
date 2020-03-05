#!/bin/bash
#===========================================================================
# List available tools and aliases
#===========================================================================

display() {
  printf "%b%-18s%b: %s\n" "${GREEN}${BOLD}" "$1" "${STD}" "$2"
}

clear
printf "%bBOSH TOOLS%b\n" "${GREEN}${BOLD}${REVERSE}" "${STD}"
display "bbr" "Bosh backup/restore cli (used with log-bosh)"
display "bosh-task" "Filter unnecessary logs when display bosh task logs"
display "log-bosh" "Log with bosh cli"
display "switch" "Switch to bosh deployment in the same bosh director"

printf "\n%bKUBERNETES TOOLS%b\n" "${GREEN}${BOLD}${REVERSE}" "${STD}"
display "helm" "Kubernetes package manager cli"
display "kubectl" "Cluster manager cli (used with log-k8s)"
display "k9s" "Cluster manager cli (used with log-k8s)"
display "log-k8s" "Log with kubernetes cli (kubectl, helm)"
display "velero" "Cluster resources, persistent volumes backup/restore (used with log-k8s)"

printf "\n%bOTHER CLI TOOLS%b\n" "${GREEN}${BOLD}${REVERSE}" "${STD}"
display "credhub-get" "Get credhub propertie value"
display "go3fr" "Parallelized and pipelined streaming access to S3 bucket cli"
display "init-mc" "Init mc config for minio access"
display "init-pynsxv" "Init pynsxv config for nsx-v access"
display "log-cf" "Log with cf cli"
display "log-credhub" "Log with credhub cli"
display "log-fly" "Log with concourse cli"
display "log-openstack" "Log with openstack cli"
display "log-shield" "Log with shield cli"
display "log-uaac" "Log with uaac cli"
display "mc" "minio cli (exec init-mc once before)"
display "prune-workers" "Prune concourse stalled workers (used with log-fly)"
display "pynsxv" "nsx-v cli (exec init-pynsxv once before)"
display "shield" "Shield cli (used with log-shield)"
display "terraform" "Terraform cli"

printf "\n%bGIT TOOLS%b\n" "${GREEN}${BOLD}${REVERSE}" "${STD}"
display "checkout" "Checkout on specific branch"
display "commit" "Commit updates"
display "gitlog" "Display git commits in nice format"
display "init-git" "Init minimal git config"
display "prune" "Prune git resources"
display "pull" "Pull updates from remote repository"
display "push" "Push updates to remote repository"
display "status" "Display local repository status"

printf "\n%bGENERIC TOOLS%b\n" "${GREEN}${BOLD}${REVERSE}" "${STD}"
display "generate-password" "Generate password (30 characters)"
display "f" "Search for a string in sub-trees"
display "proxy" "Activate/deactivate internet proxy"
display "show-cert" "Show certificate (subject, issuer and expiry)"
display "show-csr" "Show certificate signing request"
display "tn" "Set terminal name"

printf "\n"