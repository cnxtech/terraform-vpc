data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"
  cidr_block           = "${var.cidr_prefix}.0.0.0/16"

  tags {
    Name    = "${var.tag_project_identifier}"
    Budget  = "${var.tag_budget}"
    Project = "${var.tag_project_identifier}"
  }
}

resource "aws_subnet" "public" {
  count             = "${length("${data.aws_availability_zones.available.names}")}"
  vpc_id            = "${aws_vpc.main.id}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
  cidr_block        = "${var.cidr_prefix}.0.${count.index}.0/24"

  tags {
    Name    = "${var.tag_project_identifier}-${format("%03d", count.index+1)}"
    Budget  = "${var.tag_budget}"
    Project = "${var.tag_project_identifier}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name    = "${var.tag_project_identifier}"
    Budget  = "${var.tag_budget}"
    Project = "${var.tag_project_identifier}"
  }

  depends_on = ["aws_vpc.main"]
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name    = "${var.tag_project_identifier}"
    Budget  = "${var.tag_budget}"
    Project = "${var.tag_project_identifier}"
  }

  depends_on = ["aws_vpc.main"]
}

resource "aws_route_table_association" "main" {
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.main.id}"
  count          = "${length("${data.aws_availability_zones.available.names}")}"
}
