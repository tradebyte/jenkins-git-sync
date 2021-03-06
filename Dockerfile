FROM jenkins:2.32.3

COPY jenkins-config /usr/share/jenkins/ref
RUN install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt)

# You can provide the SSH keys for Jenkins (omit if you want the key to be generated, you can then retrieve the public key by running ./passwd.sh
USER root
RUN chown -R jenkins /usr/share/jenkins/ref && chmod 700 /usr/share/jenkins/ref/.ssh && chmod 600 /usr/share/jenkins/ref/.ssh/* || echo "No ssh key provided"
USER jenkins

COPY scripts/initialize.sh /usr/local/bin/initialize.sh
COPY scripts/sync-git.sh /usr/local/bin/sync-git.sh

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/initialize.sh"]