# Create Internet Gateway

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.tags,
    {
      Name = format("%s-IG-%s", var.name, var.environment)
    }
  )

}