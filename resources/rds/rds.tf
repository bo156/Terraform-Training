module "vpc" {
    source = "../vpc"
}

resource "aws_db_subnet_group" "BarakDBSubnet" {
  name       = "barak_db_subnet_group"
  subnet_ids = [module.vpc.subnet_id, module.vpc.az_subnet_id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "BarakRDS" {
    db_name = "BarakRDS"
    identifier = "barak-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.6.10"
    username = "bob"
    password = "password123"
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.BarakDBSubnet.name
}
