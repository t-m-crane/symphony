#!/bin/env bash
set -e
TIMEOUT="60s"
SOLUTION_GROUP=solution.symphony
FABRIC_GROUP=fabric.symphony
AI_GROUP=ai.symphony

function delete_crds {
  local resource_type=$1

  echo "Deleting $resource_type"
  kubectl delete crds "$resource_type" --wait --timeout=$TIMEOUT --ignore-not-found
}

echo "Deleting Symphony resources"
# Use the function for each resource types in order
delete_crds "instances.$SOLUTION_GROUP"
delete_crds "solutions.$SOLUTION_GROUP"
delete_crds "campaigns.$SOLUTION_GROUP"
delete_crds "targets.$FABRIC_GROUP"
delete_crds "devices.$FABRIC_GROUP"
delete_crds "models.$AI_GROUP"
delete_crds "skills.$AI_GROUP"
delete_crds "skillpackages.$AI_GROUP"
