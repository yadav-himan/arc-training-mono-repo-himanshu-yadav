resource "aws_instance" "ec2_instance" {

  ami                         = var.ami
  availability_zone           = "${var.aws_region}a"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = false
  associate_public_ip_address = false
  vpc_security_group_ids      = [var.security_group_id]
  tenancy                     = "default"
  subnet_id                   = var.subnet_id
  tags = {

    Name = var.name

  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    iops                  = 3000
    throughput            = 125
    volume_size           = 25
    volume_type           = "gp3"
  }






  #disable_api_stop                     = false
  #disable_api_termination              = false
  #ebs_optimized                        = false
  #get_password_data                    = false
  #hibernation                          = false
  #host_id                              = null
  #host_resource_group_arn              = null
  #iam_instance_profile                 = "AmazonSSMRoleForInstancesQuickSetup"
  #placement_group                      = null
  #placement_partition_number           = 0
  #private_ip                           = ""
  #secondary_private_ips                = []
  #source_dest_check                    = true
  #user_data                   = null
  #user_data_base64            = null
  #user_data_replace_on_change = null
  #volume_tags                 = null


  /* ebs_block_device {
    delete_on_termination = false
    device_name           = "/dev/sdb"
    encrypted             = true
    iops                  = 3000
    kms_key_id            = "arn:aws:kms:us-east-1:750515430717:key/66644dcf-2791-423f-9fff-b7d3aad7d100"
    snapshot_id           = "snap-00c2dbe9b1fd4b470"
    tags = {
      AWSApplicationMigrationServiceManaged        = "mgn.amazonaws.com"
      AWSApplicationMigrationServiceSourceServerID = "s-311b18bb43267ef27"
      Environment                                  = "prod"
      Name                                         = "cat-scrape-linux"
      map-migrated                                 = "mig31279"
    }
    throughput  = 125
    volume_size = 100
    volume_type = "gp3"
  } */


}