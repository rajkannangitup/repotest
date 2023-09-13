
#lz-vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.lz_vpc_name
  }
}

#subnet-mgmt1a
resource "aws_subnet" "mgmt_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.mgmt_subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = false
  tags = {
    Name = var.mgmt_subnet
  }
}

# ALB subnet
resource "aws_subnet" "my_alb1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr4
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_name4
  }
}

resource "aws_subnet" "my_alb2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr5
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_name5
  }
}

#app-vpc

resource "aws_vpc" "my_vpc1" {
  cidr_block = var.vpc_cidr1
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name1
  }
}

#subnet-app1a
resource "aws_subnet" "subnet_app" {
  vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnet_cidr1
  availability_zone = var.availability_zone3
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_app
  }
}

#subnet-app1b
resource "aws_subnet" "subnet_app1" {
 vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnet_cidr2
  availability_zone = var.availability_zone4
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_app1
  }
}

#subnet-db1a
resource "aws_subnet" "my_subnet_db" {
  vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnet_cidr6
  availability_zone = var.availability_zone5
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_db
  }
}

#subnet-db1b
resource "aws_subnet" "my_subnet_db1" {
  vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnet_cidr7
  availability_zone = var.availability_zone6
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_db1
  }
}

#internet gateway 

resource "aws_internet_gateway" "lz-InternetGateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.lz-InternetGateway
  }
}

resource "aws_internet_gateway" "app-InternetGateway" {
  vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = var.app-InternetGateway
  }
}

#NAT Gateway

# Allocate an Elastic IP address
resource "aws_eip" "nat_eip" {
 # vpc = true
}

# Create the NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_app1.id

  tags = {
    Name = var.app-nat-gateway
  }
}
#VPC Peering
resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = aws_vpc.my_vpc.id
  peer_vpc_id   = aws_vpc.my_vpc1.id

  auto_accept = true

  tags = {
    Name = var.vpc-peering
  }
}

# route table creation

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "public_route_table_lzvpc"
  }
}

#route add with lz igw 
resource "aws_route" "public_route_table" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = var.route_destination_cidr
  gateway_id             = aws_internet_gateway.lz-InternetGateway.id  
  }

#route add with app igw
resource "aws_route" "private_route_table" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = var.route_destination_cidr
  gateway_id             = aws_internet_gateway.app-InternetGateway.id  
  }

#route add with app NAT
#resource "aws_route" "private_route_table1" {
 # route_table_id         = aws_route_table.private_route_table.id
  #destination_cidr_block = "0.0.0.0/0"
  #gateway_id             = var.app_nat_gateway
  #}


#route table assoication

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.mgmt_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_association1" {
  subnet_id      = aws_subnet.my_alb1.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "public_association2" {
  subnet_id      = aws_subnet.my_alb2.id
  route_table_id = aws_route_table.public_route_table.id
}

# route table creation for app vpc
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = "private-route-table"
  }
}

# route table association 

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.subnet_app.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association1" {
  subnet_id      = aws_subnet.subnet_app1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association2" {
  subnet_id      = aws_subnet.my_subnet_db.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association3" {
  subnet_id      = aws_subnet.my_subnet_db1.id
  route_table_id = aws_route_table.private_route_table.id
}