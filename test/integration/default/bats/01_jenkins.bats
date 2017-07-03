#!/usr/bin/env bats
@test "Ensure we are pulling the LTS version of jenkins" {
    run grep Jenkins-stable /etc/yum.repos.d/jenkins.repo
    [ "$status" -eq 0 ]
}

@test "Ensure jenkins is installable" {
    run yum install -y jenkins java
    [ "$status" -eq 0 ]
}

@test "Ensure jenkins can run" {
    systemctl start jenkins
    run systemctl is-active jenkins
    [ "$status" -eq 0 ]
}

@test "Jenkins is returning valid content" {
    run bash -c "curl -D - --silent --max-time 5 http://127.0.0.1:8080/cli/ | grep 200"
    [ "$status" -eq 0 ]
}
