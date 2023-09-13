
#lz-vpc

variable "lz_vpc_name" {
  #description = "Name of the VPC"
  type        = string
  default     = "lz-prd-vpc"  # Default value if not provided
}

variable "vpc_cidr" {
  #description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Default value if not provided
}

variable "route_destination_cidr" {
  #description = "CIDR block for the route table lz gateway"
  type        = string
  default     = "0.0.0.0/0"  # Default value if not provided
}


variable "route_destination_cidr1" {
  #description = "CIDR block for the route table app gateway"
  type        = string
  default     = "0.0.0.0/0"  # Default value if not provided
}

#variable "app_nat_gateway_id" {
 # description = "CIDR block for the route table app gateway"
 #type        = string 
#}


#lz-mgmt-subnet

variable "mgmt_subnet" {
  description = "Name of the subnet"
  type        = string
  default     = "mgmtsubnet-prd-1a"  # Default value if not provided
}

variable "mgmt_subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/26"  # Default value if not provided
}

variable "availability_zone" {
  description = "availablity zone creation"
  type        = string
  default     = "ap-south-1a" # Default value if not provided
}

#lz-alb-subnet

variable "subnet_name4" {
  description = "Name of the subnet"
  type        = string
  default     = "albsubnet-prd-1a"  # Default value if not provided
}

variable "subnet_cidr4" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.64/26"  # Default value if not provided
}

variable "availability_zone1" {
  description = "availablity zone creation"
  type        = string
  default     = "ap-south-1a" # Default value if not provided
}

variable "subnet_name5" {
  description = "Name of the subnet"
  type        = string
  default     = "albsubnet-prd-1b"  # Default value if not provided
}

variable "subnet_cidr5" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.128/26"  # Default value if not provided
}

variable "availability_zone2" {
  description = "availablity zone creation"
  type        = string
  default     = "ap-south-1b" # Default value if not provided
}

#app-vpc

variable "vpc_name1" {
  description = "Name of the VPC"
  type        = string
  default     = "app-prd-vpc"  # Default value if not provided
}

variable "vpc_cidr1" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"  # Default value if not provided
}

#app-subnet

variable "subnet_app" {
  description = "Name of the subnet"
  type        = string
  default     = "appsubnet-prd-1a"  # Default value if not provided
}

variable "subnet_cidr1" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.1.0.0/26"  # Default value if not provided
}

variable "availability_zone3" {
  description = "availablity zone creation"
  type        = string
  default     = "ap-south-1a" # Default value if not provided
}

variable "subnet_app1" {
  description = "Name of the subnet"
  type        = string
  default     = "appsubnet-prd-1b"  # Default value if not provided
}

variable "subnet_cidr2" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.1.0.64/26"  # Default value if not provided
}

variable "availability_zone4" {
  description = "availablity zone creation"
  type        = string
  default     = "ap-south-1b" # Default value if not provided
}

#db subnet

variable "subnet_db" {
  description = "Name of the subnet"
  type        = string
  default     = "dbsubnet-prd-1a"  # Default value if not provided
}

variable "subnet_cidr6" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.1.0.128/26"  # Default value if not provided
}

variable "availability_zone5" {
  description = "availablity zone creation"
  type        = string
  default     = "ap-south-1a" # Default value if not provided
}


variable "subnet_db1" {
  description = "Name of the subnet"
  type        = string
  default     = "dbsubnet-prd-1b"  # Default value if not provided
}

variable "subnet_cidr7" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.1.0.192/26"  # Default value if not provided
}

variable "availability_zone6" {
  description = "availablity zone creation"
  type        = string
  default     = "ap-south-1b" # Default value if not provided
}

#internet gateway 
variable "lz-InternetGateway" {
  description = "internet-gateway"
  type        = string
  default     = "lz-internetgateway"  # Default value if not provided
}

variable "app-InternetGateway" {
  description = "internet-gateway"
  type        = string
  default     = "app-internetgateway"  # Default value if not provided
}
#NAT
variable "app-nat-gateway" {
  description = "nat-gateway"
  type        = string
  default     = "app-natgateway"  # Default value if not provided
}

#VPC Peering
variable "vpc-peering" {
  description = "vpc-peering from lz to app"
  type        = string
  default     = "vpc-peering"  # Default value if not provided
}