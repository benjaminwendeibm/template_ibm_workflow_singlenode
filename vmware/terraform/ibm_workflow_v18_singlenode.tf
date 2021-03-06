# =================================================================
# Copyright 2018 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================

# This is a terraform generated template generated from ibm_workflow_v18_singlenode

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "user_public_ssh_key" {
  type = "string"
  description = "User defined public SSH key used to connect to the virtual machine. The format must be in openSSH."
  default = "None"
}

variable "ibm_stack_id" {
  description = "A unique stack id."
}

variable "ibm_pm_public_ssh_key" {
  description = "Public CAMC SSH key value which is used to connect to a guest, used on VMware only."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default = "true"
}

##############################################################
# Define the vsphere provider
##############################################################
provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.3"
}

provider "camc" {
  version = "~> 0.2"
}

##############################################################
# Define pattern variables
##############################################################
##### unique stack name #####
variable "ibm_stack_name" {
  description = "A unique stack name."
}

##############################################################
# Vsphere data for provider
##############################################################
data "vsphere_datacenter" "Workflow01_datacenter" {
  name = "${var.Workflow01_datacenter}"
}
data "vsphere_datastore" "Workflow01_datastore" {
  name = "${var.Workflow01_root_disk_datastore}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}
data "vsphere_resource_pool" "Workflow01_resource_pool" {
  name = "${var.Workflow01_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}
data "vsphere_network" "Workflow01_network" {
  name = "${var.Workflow01_network_interface_label}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}

data "vsphere_virtual_machine" "Workflow01_template" {
  name = "${var.Workflow01-image}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}

##### Environment variables #####
#Variable : ibm_im_repo
variable "ibm_im_repo" {
  type = "string"
  description = "IBM Software  Installation Manager Repository URL (https://<hostname/IP>:<port>/IMRepo) "
}

#Variable : ibm_im_repo_password
variable "ibm_im_repo_password" {
  type = "string"
  description = "IBM Software  Installation Manager Repository Password"
}

#Variable : ibm_im_repo_user
variable "ibm_im_repo_user" {
  type = "string"
  description = "IBM Software  Installation Manager Repository username"
  default = "repouser"
}

#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type = "string"
  description = "IBM Software Repo Password"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type = "string"
  description = "IBM Software Repo Username"
  default = "repouser"
}


##### virtualmachine variables #####

##### Workflow01 variables #####
#Variable : Workflow01-image
variable "Workflow01-image" {
  type = "string"
  description = "Identifier of the operating system image or template that you use to create the virtual image"
}

#Variable : Workflow01-name
variable "Workflow01-name" {
  type = "string"
  description = "Short hostname of virtual machine"
}

#Variable : Workflow01-os_admin_user
variable "Workflow01-os_admin_user" {
  type = "string"
  description = "Name of the administrator account in the virtual machine that will be accessed via SSH"
}

#Variable : Workflow01_install_dir
variable "Workflow01_install_dir" {
  type = "string"
  description = "The installation root directory for IBM Business Automation Workflow product binaries"
  default = "/home/workflowuser01/IBM/Workflow/v18.0"
}

#Variable : Workflow01_bpm_os_user_comment
variable "Workflow01_bpm_os_user_comment" {
  type = "string"
  description = "Comments that you can add when you create the user identifier"
  default = "WAS administrative user"
}

#Variable : Workflow01_bpm_os_user_gid
variable "Workflow01_bpm_os_user_gid" {
  type = "string"
  description = "The operating system group name that will be assigned to the product installation"
  default = "workflowgroup"
}

#Variable : Workflow01_bpm_os_user_home
variable "Workflow01_bpm_os_user_home" {
  type = "string"
  description = "Location of the home directory that the operating system user uses for product installation"
  default = "/home/workflowuser01"
}

#Variable : Workflow01_bpm_os_user_ldap_user
variable "Workflow01_bpm_os_user_ldap_user" {
  type = "string"
  description = "A flag that indicates whether to create the WebSphere user locally or to use an LDAP-based user"
  default = "false"
}

#Variable : Workflow01_bpm_os_user_name
variable "Workflow01_bpm_os_user_name" {
  type = "string"
  description = "The user identifier to the operating system which will be used to install the product. The identifier is created if it does not exist."
  default = "workflowuser01"
}

#Variable : Workflow01_product_version
variable "Workflow01_product_version" {
  type = "string"
  description = "The product version of IBM Business Automation Workflow"
  default = "18001"
}
#Variable : Workflow01_product_edition
variable "Workflow01_product_edition" {
  type = "string"
  description = "The product edition of IBM Business Automation Workflow: Server, ESB, or Express"
  default = "Server"
}
#Variable : Workflow01_features
variable "Workflow01_features" {
  type = "string"
  description = "IBM Business Automation Workflow features: WorkflowEnterprise.Production, WorkflowEnterprise.NonProduction, EnterpriseServiceBus.Production, EnterpriseServiceBus.NonProduction, WorkflowExpress.Production or WorkflowExpress.NonProduction"
  default = "WorkflowEnterprise.Production"
}
#Variable : Workflow01_was_offering_id
variable "Workflow01_was_offering_id" {
  type = "string"
  description = "The offering ID of WebSphere Application Server"
  default = "com.ibm.websphere.ND.v85"
}
#Variable : Workflow01_was_profile_id
variable "Workflow01_was_profile_id" {
  type = "string"
  description = "The profile identifier of WebSphere Application Server"
  default = "IBM WebSphere Application Server Network Deployment V8.5"
}
#Variable : Workflow01_bpm_offering_id
variable "Workflow01_bpm_offering_id" {
  type = "string"
  description = "The offering ID of IBM Business Automation Workflow"
  default = "com.ibm.bpm.ADV.v85"
}
#Variable : Workflow01_db2_offering_id
variable "Workflow01_db2_offering_id" {
  type = "string"
  description = "The offering ID of the DB2 database system"
  default = "com.ibm.ws.DB2EXP.linuxia64"
}
#Variable : Workflow01_install_mode
variable "Workflow01_install_mode" {
  type = "string"
  description = "The installation mode for IBM Business Automation Workflow"
  default = "nonAdmin"
}
#Variable : Workflow01_bpm_os_user_shell
variable "Workflow01_bpm_os_user_shell" {
  type = "string"
  description = "Shell that the operating system user uses for product installation"
  default = "/bin/bash"
}
variable "Workflow01_cell_admin_username" {
  type = "string"
  description = "The cell administrator's name"
  default = "celladmin"
}
variable "Workflow01_cell_admin_userpassword" {
  type = "string"
  description = "The cell administrator's password"
}
variable "Workflow01_de_admin_username" {
  type = "string"
  description = "The user name of the development environment administrator"
  default = "deadmin"
}
variable "Workflow01_de_admin_userpassword" {
  type = "string"
  description = "The password of the development environment administrator"
}
variable "Workflow01_config_product_type" {
  type = "string"
  description = "The product type for configuration: Advanced, AdvancedOnly, Express, or Standard"
}
variable "Workflow01_config_deployment_type" {
  type = "string"
  description = "The deployment type for configuration: Workflow Center or Workflow Server"
}
variable "Workflow01_config_cluster_type" {
  type = "string"
  description = "The cluster type for the configuration: SingleCluster"
}
variable "Workflow01_db2_install" {
  type = "string"
  description = "Installs the DB2 database system"
}
variable "Workflow01_db2_port" {
  type = "string"
  description = "The port of DB2 instance"
}
variable "Workflow01_db2_instance_username" {
  type = "string"
  description = "The instance user name of the DB2"
  default = "db2admin"
}
variable "Workflow01_db2_instance_userpassword" {
  type = "string"
  description = "The password to the DB2 instance"
}
variable "Workflow01_db2_fence_newuser" {
  type = "string"
  description = "Creates a fence user"
}
variable "Workflow01_db2_fence_username" {
  type = "string"
  description = "The fence user name of the DB2 instance"
  default = "fenceuser"
}
variable "Workflow01_db2_fence_userpassword" {
  type = "string"
  description = "The fence password to the DB2 instance"
}
variable "Workflow01_db2_das_newuser" {
  type = "string"
  description = "Creates a user of the administration server"
}
variable "Workflow01_db2_das_username" {
  type = "string"
  description = "The user name to access the administration server of the DB2 instance"
  default = "dasuser"
}
variable "Workflow01_db2_das_userpassword" {
  type = "string"
  description = "The password to the administration server of the DB2"
}
variable "Workflow01_db2_common_database" {
  type = "string"
  description = "Specifies the name of the Common database"
  default = "CMNDB"
}
variable "Workflow01_db2_process_database" {
  type = "string"
  description = "Specifies the name of the Process database"
  default = "BPMDB"
}
variable "Workflow01_db2_perf_database" {
  type = "string"
  description = "Specifies the name of the Performance Data Warehouse database"
  default = "PDWDB"
}
variable "Workflow01_db2_cpe_database" {
  type = "string"
  description = "Specifies the name of the Content database"
  default = "CPEDB"
}
variable "Workflow01_root_disk_type" {
  type = "string"
  description = "Type of template disk volume"
  default = "eager_zeroed"
}
variable "Workflow01_ps_environment_purpose" {
  type = "string"
  description = "Specifies the Workflow Server environment: Development, Test, Staging, or Production"
  default = "Production"
}
variable "Workflow01_ps_offline" {
  type = "string"
  description = "Specifies whether Workflow Server is offline or online"
  default = "false"
}
variable "Workflow01_ps_pc_transport_protocol" {
  type = "string"
  description = "Specifies the transport protocol through which Workflow Server connects to Workflow Center"
  default = "https"
}
variable "Workflow01_ps_pc_hostname" {
  type = "string"
  description = "Specifies the Workflow Center hostname which Workflow Server connects to"
}
variable "Workflow01_ps_pc_port" {
  type = "string"
  description = "Specifies the Workflow Center port which Workflow Server connects to"
  default = "9080"
}
variable "Workflow01_ps_pc_contextroot_prefix" {
  type = "string"
  description = "Specifies the Workflow Center context root prefix which Workflow Server connects to"
}
variable "Workflow01_ps_pc_alias_user" {
  type = "string"
  description = "Specifies the Workflow Center alias user which Workflow Server connects to"
  default = "admin"
}
variable "Workflow01_ps_pc_alias_password" {
  type = "string"
  description = "Specifies the alias user password of Workflow Center that Workflow Server connects to"
  default = "admin"
}
variable "Workflow01_ifix_names" {
  type = "list"
  description = "Indicates the full names of ifix installation packages - e.g 8.6.10018001-WS-BPMPCPD-TFPD12345.zip"
}

#Variable : Workflow01_was_profile_dir
variable "Workflow01_was_profile_dir" {
  type = "string"
  description = "The directory path that contains WebSphere Application Server profiles"
  default = "/opt/IBM/WebSphere/AppServer/profiles"
}

#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "vault_content": {
    "item": "secrets",
    "values": {},
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}


#########################################################
##### Resource : Workflow01
#########################################################

variable "Workflow01-os_password" {
  type = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "Workflow01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "Workflow01_datacenter" {
  description = "Target vSphere datacenter for virtual machine creation"
}

variable "Workflow01_domain" {
  description = "Domain Name of virtual machine"
}

variable "Workflow01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default = "4"
}

variable "Workflow01_memory" {
  description = "Memory assigned to the virtual machine in megabytes."
  default = "8192"
}

variable "Workflow01_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
}

variable "Workflow01_resource_pool" {
  description = "Target vSphere Resource Pool to host the virtual machine"
}

variable "Workflow01_dns_suffixes" {
  type = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "Workflow01_dns_servers" {
  type = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "Workflow01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "Workflow01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "Workflow01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "Workflow01_ipv4_prefix_length" {
  description = "IPv4 prefix length for vNIC configuration. The value must be a number between 8 and 32"
}

variable "Workflow01_adapter_type" {
  description = "Network adapter type for vNIC Configuration"
  default = "vmxnet3"
}

variable "Workflow01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "Workflow01_root_disk_keep_on_remove" {
  type = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
  default = "false"
}

variable "Workflow01_root_disk_size" {
  description = "Size of template disk volume. Should be equal to template's disk size"
  default = "100"
}

variable "Workflow01_root_disk_thin_provisioned" {
  description = "The template disk volume is thin_provisioned."
  default = "true"
}

# vsphere vm
resource "vsphere_virtual_machine" "Workflow01" {
  name = "${var.Workflow01-name}"
  folder = "${var.Workflow01_folder}"
  num_cpus = "${var.Workflow01_number_of_vcpu}"
  memory = "${var.Workflow01_memory}"
  resource_pool_id = "${data.vsphere_resource_pool.Workflow01_resource_pool.id}"
  datastore_id = "${data.vsphere_datastore.Workflow01_datastore.id}"
  guest_id = "${data.vsphere_virtual_machine.Workflow01_template.guest_id}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.Workflow01_template.id}"
    customize {
      linux_options {
        domain = "${var.Workflow01_domain}"
        host_name = "${var.Workflow01-name}"
      }
    network_interface {
      ipv4_address = "${var.Workflow01_ipv4_address}"
      ipv4_netmask = "${var.Workflow01_ipv4_prefix_length}"
    }
    ipv4_gateway = "${var.Workflow01_ipv4_gateway}"
    dns_suffix_list = "${var.Workflow01_dns_suffixes}"
    dns_server_list = "${var.Workflow01_dns_servers}"
    }
  }

  network_interface {
    network_id = "${data.vsphere_network.Workflow01_network.id}"
    adapter_type = "${var.Workflow01_adapter_type}"
  }

  disk {
    label = "${var.Workflow01-name}.disk0"
    size = "${var.Workflow01_root_disk_size}"
    keep_on_remove = "${var.Workflow01_root_disk_keep_on_remove}"
    thin_provisioned = "${var.Workflow01_root_disk_thin_provisioned}"
  }

  # Specify the connection
  connection {
    type = "ssh"
    user = "${var.Workflow01-os_admin_user}"
    password = "${var.Workflow01-os_password}"
  }

  provisioner "file" {
    destination = "Workflow01_add_ssh_key.sh"
    content     = <<EOF
# =================================================================
# Copyright 2018 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================
#!/bin/bash

if (( $# != 3 )); then
echo "usage: arg 1 is user, arg 2 is public key, arg3 is CAMC Public Key"
exit -1
fi

userid="$1"
ssh_key="$2"
camc_ssh_key="$3"

user_home=$(eval echo "~$userid")
user_auth_key_file=$user_home/.ssh/authorized_keys
echo "$user_auth_key_file"
if ! [ -f $user_auth_key_file ]; then
echo "$user_auth_key_file does not exist on this system, creating."
mkdir $user_home/.ssh
chmod 700 $user_home/.ssh
touch $user_home/.ssh/authorized_keys
chmod 600 $user_home/.ssh/authorized_keys
else
echo "user_home : $user_home"
fi

if [[ $ssh_key = 'None' ]]; then
echo "skipping user key add, 'None' specified"
else
echo "$user_auth_key_file"
echo "$ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi
fi

echo "$camc_ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "bash -c 'chmod +x Workflow01_add_ssh_key.sh'",
      "bash -c './Workflow01_add_ssh_key.sh  \"${var.Workflow01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> Workflow01_add_ssh_key.log 2>&1'"
    ]
  }

}

#########################################################
##### Resource : Workflow01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "Workflow01_chef_bootstrap_comp" {
  depends_on = ["camc_vaultitem.VaultItem","vsphere_virtual_machine.Workflow01"]
  name = "Workflow01_chef_bootstrap_comp"
  camc_endpoint = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "node_attributes": {
    "ibm_internal": {
      "stack_id": "${var.ibm_stack_id}",
      "stack_name": "${var.ibm_stack_name}",
      "vault": {
        "item": "secrets",
        "name": "${var.ibm_stack_id}"
      }
    }
  }
}
EOT
}


#########################################################
##### Resource : Workflow01_workflow_v18_install
#########################################################

resource "camc_softwaredeploy" "Workflow01_workflow_v18_install" {
  depends_on = ["camc_bootstrap.Workflow01_chef_bootstrap_comp"]
  name = "Workflow01_workflow_v18_install"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "runlist": "role[workflow_v18_0_201806_install]",
  "node_attributes": {
    "ibm": {
      "im_repo": "${var.ibm_im_repo}",
      "im_repo_user": "${var.ibm_im_repo_user}",
      "sw_repo": "${var.ibm_sw_repo}/workflow",
      "sw_repo_user": "${var.ibm_sw_repo_user}",
      "log_dir": "${var.Workflow01_bpm_os_user_home}/var/log/ibm_cloud",
      "ifix_repo": "${var.ibm_sw_repo}/workflow/ifixes"
    },
    "ibm_internal": {
      "roles": "[workflow_v18_0_201806_install]"
    },
    "was": {
      "offering_id": "${var.Workflow01_was_offering_id}"
    },
    "workflow":{
      "install_mode": "${var.Workflow01_install_mode}",
      "os_users": {
        "workflow": {
          "comment": "${var.Workflow01_bpm_os_user_comment}",
          "gid": "${var.Workflow01_bpm_os_user_gid}",
          "home": "${var.Workflow01_bpm_os_user_home}",
          "ldap_user": "${var.Workflow01_bpm_os_user_ldap_user}",
          "name": "${var.Workflow01_bpm_os_user_name}",
          "shell": "${var.Workflow01_bpm_os_user_shell}"
          }
      },
      "im_version": "1.8.9",
      "version": "${var.Workflow01_product_version}",
      "features": "${var.Workflow01_features}",
      "offering_id": "${var.Workflow01_bpm_offering_id}",
      "install_dir": "${var.Workflow01_install_dir}",
      "ifix_names": "${join(",",var.Workflow01_ifix_names)}",
      "profile_id": "${var.Workflow01_was_profile_id}"
    },
    "db2": {
      "install": "${var.Workflow01_db2_install}",
      "offering_version": "11.1.0",
      "offering_id": "${var.Workflow01_db2_offering_id}",
      "port": "${var.Workflow01_db2_port}",
      "username": "${var.Workflow01_db2_instance_username}",
      "fenced_newuser": "${var.Workflow01_db2_fence_newuser}",
      "fenced_username": "${var.Workflow01_db2_fence_username}",
      "das_newuser": "${var.Workflow01_db2_das_newuser}",
      "das_username": "${var.Workflow01_db2_das_username}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "db2": {
        "password": "${var.Workflow01_db2_instance_userpassword}",
        "fenced_password": "${var.Workflow01_db2_fence_userpassword}",
        "das_password": "${var.Workflow01_db2_das_userpassword}"
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}
#########################################################
##### Resource : Workflow01_workflow_v18_config
#########################################################
#"db_alias_password": "${var.Workflow01_db2_instance_userpassword}",
resource "camc_softwaredeploy" "Workflow01_workflow_v18_config" {
  depends_on = ["camc_softwaredeploy.Workflow01_workflow_v18_install"]
  name = "Workflow01_workflow_v18_config"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "runlist": "role[workflow_v18_0_201806_create_singlecluster]",
  "node_attributes": {
    "ibm_internal": {
      "roles": "[workflow_v18_0_201806_create_singlecluster]"
    },
    "workflow":{
      "os_users": {
        "workflow": {
          "gid": "${var.Workflow01_bpm_os_user_gid}",
          "name": "${var.Workflow01_bpm_os_user_name}"
          }
      },
      "install_dir": "${var.Workflow01_install_dir}",
      "config": {
        "product_type": "${var.Workflow01_config_product_type}",
        "deployment_type": "${var.Workflow01_config_deployment_type}",
        "cluster_type": "${var.Workflow01_config_cluster_type}",
        "celladmin_alias_user": "${var.Workflow01_cell_admin_username}",
        "deadmin_alias_user": "${var.Workflow01_de_admin_username}",
        "dmgr_hostname": "${var.Workflow01-name}",
        "db2_hostname": "${var.Workflow01-name}",
        "node_hostname": "${var.Workflow01-name}",
        "db2_port": "${var.Workflow01_db2_port}",
        "db_alias_user": "${var.Workflow01_db2_instance_username}",
        "db2_cmndb_name": "${var.Workflow01_db2_common_database}",
        "db2_bpmdb_name": "${var.Workflow01_db2_process_database}",
        "db2_pdwdb_name": "${var.Workflow01_db2_perf_database}",
        "db2_cpedb_name": "${var.Workflow01_db2_cpe_database}",
        "ps_environment_purpose": "${var.Workflow01_ps_environment_purpose}",
        "ps_offline": "${var.Workflow01_ps_offline}",
        "ps_pc_transport_protocol": "${var.Workflow01_ps_pc_transport_protocol}",
        "ps_pc_hostname": "${var.Workflow01_ps_pc_hostname}",
        "ps_pc_port": "${var.Workflow01_ps_pc_port}",
        "ps_pc_contextroot_prefix": "${var.Workflow01_ps_pc_contextroot_prefix}",
        "ps_pc_alias_user": "${var.Workflow01_ps_pc_alias_user}"
      }
    },
    "db2": {
      "port": "${var.Workflow01_db2_port}",
      "username": "${var.Workflow01_db2_instance_username}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "workflow": {
        "config": {
          "celladmin_alias_password": "${var.Workflow01_cell_admin_userpassword}",
          "deadmin_alias_password": "${var.Workflow01_de_admin_userpassword}",
          "db_alias_password": "${var.Workflow01_db2_instance_userpassword}",
          "ps_pc_alias_password": "${var.Workflow01_ps_pc_alias_password}"
        }
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}
output "Workflow01_ip" {
  value = "VM IP Address : ${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}"
}

output "Workflow01_name" {
  value = "${var.Workflow01-name}"
}

output "Workflow01_roles" {
  value = "was_create_standalone,was_v855_install"
}

output "stack_id" {
  value = "${var.ibm_stack_id}"
}
