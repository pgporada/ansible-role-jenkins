#!/usr/bin/env bats

@test "Idempotence test - the second run should change nothing" {
    run bash -c "ansible-playbook -i /tmp/kitchen/hosts /tmp/kitchen/default.yml -c local --vault-password-file /tmp/kitchen/vault_password | grep -q 'changed=0.*failed=0' && exit 0 || exit 1"
    [ "$status" -eq 0 ]
}
